import Apollo
import RocketReserverAPI
import SwiftUI

@MainActor
class LaunchListViewModel: ObservableObject {
    
    private let apolloClient: ApolloClient
    
    @Published var launches = [LaunchListQuery.Data.Launches.Launch]()
    @Published var lastConnection: LaunchListQuery.Data.Launches?
    @Published var activeRequest: Bool = false
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
    }
    
    private func handleTripsBooked(value: Int) {
        var message: String
        switch value {
        case 1:
            message = "A new trip was booked! 🚀"
        case -1:
            message = "A trip was cancelled! 😭"
        default:
            appAlert = .basic(title: "Unexpected Value",
                              message: "Subscription returned an unexpected value: \(value)")
            return
        }
        
        notificationMessage = message
    }
    
    // MARK: - Launch Loading
    
    func loadMoreLaunchesIfTheyExist() async {
        guard !activeRequest else { return }
        
        guard let connection = self.lastConnection else {
            await self.loadMoreLaunches(from: nil)
            return
        }
        
        guard connection.hasMore else {
            return
        }
        
        await self.loadMoreLaunches(from: connection.cursor)
    }
    
    private func loadMoreLaunches(from cursor: String?) async {
        defer {
            activeRequest = false
        }
        
        do {
            activeRequest = true
            let response = try await apolloClient.fetch(query: LaunchListQuery(cursor: cursor ?? .null))
            
            if let errors = response.errors {
                appAlert = .errors(errors: errors)
            }
            
            if let launchConnection = response.data?.launches {
                lastConnection = launchConnection
                launches.append(contentsOf: launchConnection.launches.compactMap({ $0 }))
            }
        } catch {
            appAlert = .errors(errors: [error])
        }
    }
    
}
