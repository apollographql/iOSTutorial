import SwiftUI
import Apollo

struct LaunchListView: View {
    @StateObject private var viewModel: LaunchListViewModel
    let apolloClient: ApolloClient
    
    init(apolloClient: ApolloClient) {
        self.apolloClient = apolloClient
        _viewModel = StateObject(wrappedValue: LaunchListViewModel(apolloClient: apolloClient))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.launches.count, id: \.self) { index in
                    NavigationLink(destination: DetailView(apolloClient: apolloClient, launchID: viewModel.launches[index].id)) {
                        LaunchRow(launch: viewModel.launches[index])
                    }
                }
                if viewModel.lastConnection?.hasMore != false {
                    if !viewModel.activeRequest {
                        Button(action: {
                            Task {
                                await viewModel.loadMoreLaunchesIfTheyExist()
                            }
                        }, label: {
                          Text("Tap to load more")
                        })
                    } else {
                        Text("Loading...")
                    }
                }
            }
            .task {
                await viewModel.loadMoreLaunchesIfTheyExist()
            }
            .navigationTitle("Rocket Launches")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView(apolloClient: .default())
    }
}
