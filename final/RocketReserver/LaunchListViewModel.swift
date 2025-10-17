import SwiftUI
import Apollo
import RocketReserverAPI

@MainActor
class LaunchListViewModel: ObservableObject {
    
    @Published var launches = [LaunchListQuery.Data.Launches.Launch]()
    @Published var lastConnection: LaunchListQuery.Data.Launches?
    @Published var activeRequest: Bool = false
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
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
            let response = try await ApolloClient.shared.fetch(query: LaunchListQuery(cursor: cursor ?? .null))
            
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
