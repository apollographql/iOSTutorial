import SwiftUI

@MainActor
class LaunchListViewModel: ObservableObject {
    
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    // MARK: - Launch Loading
    
    func loadMoreLaunchesIfTheyExist() async {
        // TODO (Section 8 - https://www.apollographql.com/docs/ios/tutorial/tutorial-paginate-results#update-launchlistviewmodel-to-use-cursor)
    }
    
    func loadMoreLaunches() async {
        // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#configure-launchlistviewmodel)
    }
    
}
