import Apollo
import RocketReserverAPI
import SwiftUI

class UserViewModel: ObservableObject {

    @Published var trips: [MeQuery.Data.Me.Trip]?
    @Published var appAlert: AppAlert?

    func loadTrips() {
        Network.shared.apollo.fetch(query: MeQuery(), cachePolicy: .returnCacheDataAndFetch) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                self.trips = graphQLResult.data?.me?.trips.compactMap({ $0 })

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
}
