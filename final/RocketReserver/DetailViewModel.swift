import SwiftUI
import Apollo
import RocketReserverAPI
import KeychainSwift

@MainActor
class DetailViewModel: ObservableObject {
    
    let launchID: RocketReserverAPI.ID
    
    @Published var launch: LaunchDetailsQuery.Data.Launch?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init(
        launchID: RocketReserverAPI.ID
    ) {
        self.launchID = launchID
    }
    
    func loadLaunchDetails(forceReload: Bool = false) async {
        guard forceReload || launchID != launch?.id else {
            return
        }
        
        let cachePolicy: CachePolicy.Query.SingleResponse = forceReload ? .networkOnly : .cacheFirst
        
        do {
            let response = try await ApolloClient.shared.fetch(
                query: LaunchDetailsQuery(launchId: launchID),
                cachePolicy: cachePolicy
            )
            
            if let errors = response.errors {
                appAlert = .errors(errors: errors)
            }
            
            if let launch = response.data?.launch {
                self.launch = launch
            }
        } catch {
            appAlert = .errors(errors: [error])
        }
    }
    
    func bookOrCancel() async {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
        
        guard let launch = launch else {
            return
        }
        
        launch.isBooked ? await cancelTrip(with: launch.id) : await bookTrip(with: launch.id)
    }
    
    private func bookTrip(with id: RocketReserverAPI.ID) async {
        do {
            let response = try await ApolloClient.shared.perform(mutation: BookTripMutation(id: id))
            
            if let errors = response.errors {
                appAlert = .errors(errors: errors)
            }
            
            if let bookingResult = response.data?.bookTrips {
                if bookingResult.success {
                    appAlert = .basic(title: "Success!",
                                      message: bookingResult.message ?? "Trip booked successfully")
                    await loadLaunchDetails(forceReload: true)
                } else {
                    appAlert = .basic(title: "Could not book trip",
                                      message: bookingResult.message ??
                                      "Something went wrong while booking the trip")
                }
            }
        } catch {
            appAlert = .errors(errors: [error])
        }
    }
    
    private func cancelTrip(with id: RocketReserverAPI.ID) async {
        do {
            let response = try await ApolloClient.shared.perform(mutation: CancelTripMutation(launchId: id))
            
            if let errors = response.errors {
                appAlert = .errors(errors: errors)
            }
            
            if let cancelResult = response.data?.cancelTrip {
                if cancelResult.success {
                    appAlert = .basic(title: "Trip cancelled",
                                      message: cancelResult.message ?? "Your trip has been officially cancelled")
                    await loadLaunchDetails(forceReload: true)
                } else {
                    appAlert = .basic(title: "Could not cancel trip",
                                      message: cancelResult.message ?? "Something went wrong")
                }
            }
        } catch {
            appAlert = .errors(errors: [error])
        }
    }
    
    private func isLoggedIn() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(LoginView.loginKeychainKey) != nil
    }
    
}
