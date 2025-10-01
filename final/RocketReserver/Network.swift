import Foundation
import Apollo
//import ApolloWebSocket

class Network {
    
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/graphql")!
//        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
//
//        let webSocket = WebSocket(
//            url: URL(string: "wss://apollo-fullstack-tutorial.herokuapp.com/graphql")!,
//            protocol: .graphql_ws
//        )
//
//        let webSocketTransport = WebSocketTransport(websocket: webSocket)
//
//        let splitTransport = SplitNetworkTransport(
//            uploadingNetworkTransport: transport,
//            webSocketNetworkTransport: webSocketTransport
//        )
//
//        return ApolloClient(networkTransport: splitTransport, store: store)
        let networkTransport = RequestChainNetworkTransport(
            urlSession: URLSession.shared,
            interceptorProvider: DefaultInterceptorProvider.shared,
            store: store,
            endpointURL: url
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    
}
