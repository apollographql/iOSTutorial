import SwiftUI
import KeychainSwift

struct LaunchListView: View {
    
    @StateObject private var viewModel = LaunchListViewModel()
    @State private var isShowingLogin = false
    @State private var isShowingUser = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.launches.count, id: \.self) { index in
                    NavigationLink(destination: DetailView(launchID: viewModel.launches[index].id)) {
                        LaunchRow(launch: viewModel.launches[index].fragments.launchListDetail)
                    }
                }
                if viewModel.lastConnection?.hasMore != false {
                    if viewModel.activeRequest == nil {
                        Button(action: viewModel.loadMoreLaunchesIfTheyExist) {
                            Text("Tap to load more")
                        }
                    } else {
                        Text("Loading...")
                    }
                }
            }
            .task {
                viewModel.loadMoreLaunchesIfTheyExist()
            }
            .navigationTitle("Rocket Launches")
            .toolbar {
                Button(action: {
                    guard self.isLoggedIn() else {
                        isShowingLogin = true
                        return
                    }

                    self.isShowingUser.toggle()
                }, label: {
                    Image(systemName: "person.circle")
                    .overlay(
                        TripBadgeView()
                    )
                })
                .sheet(isPresented: $isShowingUser) {
                    UserView()
                }
            }
            .sheet(isPresented: $isShowingLogin) {
                LoginView(isPresented: $isShowingLogin)
            }
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }

    private func isLoggedIn() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(LoginView.loginKeychainKey) != nil
    }

}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
