import SwiftUI
import Apollo

@main
struct RocketReserverApp: App {
    let apolloClient: ApolloClient = .default()
    
    var body: some Scene {
        WindowGroup {
            LaunchListView(apolloClient: apolloClient)
        }
    }
}
