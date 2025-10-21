import Foundation
import Apollo
import ApolloAPI

struct NetworkInterceptorProvider: InterceptorProvider {
    
    func httpInterceptors<Operation: GraphQLOperation>(for operation: Operation) -> [any HTTPInterceptor] {
        return [AuthorizationInterceptor()] + DefaultInterceptorProvider.shared.httpInterceptors(for: operation)
    }
    
}
