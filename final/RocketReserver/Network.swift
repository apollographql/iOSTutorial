import Foundation
import Apollo
import ApolloWebSocket

class Network {
    
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://ios-spacex-router-1da713d90333.herokuapp.com/")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        let webSocket = WebSocket(
            url: URL(string: "wss://ios-spacex-subgraph-c17ee3a300af.herokuapp.com/graphql")!,
            protocol: .graphql_ws
        )

        let webSocketTransport = WebSocketTransport(websocket: webSocket)

        let splitTransport = SplitNetworkTransport(
            uploadingNetworkTransport: transport,
            webSocketNetworkTransport: webSocketTransport
        )

        return ApolloClient(networkTransport: splitTransport, store: store)
    }()
    
}
