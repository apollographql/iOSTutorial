import Apollo
import KeychainSwift
import RocketReserverAPI
import SwiftUI

class TripsBadgeViewModel: ObservableObject {

    @Published var count: Int = 0
    @Published var appAlert: AppAlert?

    func loadUserTrips() {
        guard isLoggedIn() else {
            count = 0
            return
        }

        _ = Network.shared.apollo.watch(
            query: MeQuery(), cachePolicy: .returnCacheDataAndFetch
        ) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case.success(let graphQLResult):
                count = graphQLResult.data?.me?.trips.count ?? 0

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
