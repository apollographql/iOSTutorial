import Apollo
import KeychainSwift
import RocketReserverAPI
import SwiftUI

class DetailViewModel: ObservableObject {
    
    let launchID: RocketReserverAPI.ID
    private var watcher: GraphQLQueryWatcher<LaunchDetailsQuery>?

    @Published var launch: LaunchDetailsQuery.Data.Launch?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init(launchID: RocketReserverAPI.ID) {
        self.launchID = launchID
    }
    
    func loadLaunchDetails() {
        watcher = Network.shared.apollo.watch(
            query: LaunchDetailsQuery(launchId: launchID), cachePolicy: .returnCacheDataAndFetch
        ) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case.success(let graphQLResult):
                if let launch = graphQLResult.data?.launch {
                    self.launch = launch
                }
                
                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }

    deinit {
        watcher?.cancel()
    }

    func bookOrCancel() {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
        
        guard let launch = launch else {
            return
        }
        
        launch.isBooked ? cancelTrip(with: launch.id) : bookTrip(with: launch.id)
    }
    
    private func bookTrip(with id: RocketReserverAPI.ID) {
        Network.shared.apollo.perform(mutation: BookTripMutation(id: id)) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let graphQLResult):
                if let bookingResult = graphQLResult.data?.bookTrips {
                    if bookingResult.success {
                        self.appAlert = .basic(title: "Success!",
                                               message: bookingResult.message ?? "Trip booked successfully")

                        if let bookedTrip = bookingResult.launches?.first ?? nil {
                            Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                                let cacheMutation = MeTripsLocalCacheMutation()

                                try transaction.update(cacheMutation) { data in
                                    data.me?.trips.append(.init(
                                        isBooked: bookedTrip.isBooked,
                                        id: bookedTrip.id,
                                        site: bookedTrip.site,
                                        mission: bookedTrip.mission
                                    ))
                                }
                            }
                        }
                    } else {
                        self.appAlert = .basic(title: "Could not book trip",
                                               message: bookingResult.message ?? "Unknown failure")
                    }
                }
                
                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    private func cancelTrip(with id: RocketReserverAPI.ID) {
        Network.shared.apollo.perform(mutation: CancelTripMutation(launchId: id)) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let graphQLResult):
                if let cancelResult = graphQLResult.data?.cancelTrip {
                    if cancelResult.success {
                        self.appAlert = .basic(title: "Trip cancelled",
                                               message: cancelResult.message ?? "Your trip has been officially cancelled")

                        Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                            let cacheMutation = MeTripsLocalCacheMutation()

                            try transaction.update(cacheMutation) { data in
                                data.me?.trips.removeAll(where: { $0?.id == id })
                            }
                        }
                    } else {
                        self.appAlert = .basic(title: "Could not cancel trip",
                                               message: cancelResult.message ?? "Unknown failure.")
                    }
                }
                
                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    private func isLoggedIn() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(LoginView.loginKeychainKey) != nil
    }
    
}
