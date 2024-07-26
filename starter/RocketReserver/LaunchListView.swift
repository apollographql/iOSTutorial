import SwiftUI

struct LaunchListView: View {
    
    @StateObject private var viewModel = LaunchListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { index in
                    LaunchRow()
                }
            }
            .task {
                // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#use-launches-in-the-ui)
            }
            .navigationTitle("Rocket Launches")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
