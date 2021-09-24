//
//  Network2.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 9/8/20.
//  Copyright © 2020 Apollo GraphQL. All rights reserved.
//

import Foundation
import Apollo


// Code for the [Advanced Networking Example](https://www.apollographql.com/docs/ios/initialization/#advanced-client-creation) to make sure it compiles - not used in this application
enum AdvancedSample {
    
    class UserManager {
        init() {}
        
        static let shared = UserManager()
        var token: Token? = nil
        
        func renewToken(completion: @escaping ((Result<Token, Error>) -> Void)) {
            
        }
    }
    
    class Token {
        init() {}
        var isExpired: Bool = false
        var value: String = ""
    }
    
    struct Logger {
        
        enum LogLevel {
            case debug
            case error
        }
        
        static func log(_ level: LogLevel, _ text: String) {
            
        }
    }
    class Network {
        static let shared = Network()
        
        private(set) lazy var apollo: ApolloClient = {
            let client = URLSessionClient()
            let cache = InMemoryNormalizedCache()
            let store = ApolloStore(cache: cache)
            let provider = NetworkInterceptorProvider(store: store, client: client)
            let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!
            let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                     endpointURL: url)
            return ApolloClient(networkTransport: requestChainTransport,
                                store: store)
        }()
    }
    
    struct NetworkInterceptorProvider: InterceptorProvider {
        
        private let store: ApolloStore
        private let client: URLSessionClient
        
        init(store: ApolloStore,
             client: URLSessionClient) {
            self.store = store
            self.client = client
        }
        
        func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
            return [
                MaxRetryInterceptor(),
                CacheReadInterceptor(store: self.store),
                TokenAddingInterceptor(),
                RequestLoggingInterceptor(),
                NetworkFetchInterceptor(client: self.client),
                ResponseLoggingInterceptor(),
                ResponseCodeInterceptor(),
                JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
                AutomaticPersistedQueryInterceptor(),
                CacheWriteInterceptor(store: self.store)
            ]
        }
    }
    
    class UserManagementInterceptor: ApolloInterceptor {
        
        enum UserError: Error {
            case noUserLoggedIn
        }
        
        func addTokenAndProceed<Operation: GraphQLOperation>(
            _ token: Token,
            to request: HTTPRequest<Operation>,
            chain: RequestChain,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            request.addHeader(name: "Authentication", value: "Bearer: \(token.value)")
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            guard let token = UserManager.shared.token else {
                chain.handleErrorAsync(UserError.noUserLoggedIn,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            
            if token.isExpired {
                UserManager.shared.renewToken { [weak self] tokenRenewResult in
                    guard let self = self else {
                        return
                    }
                    
                    switch tokenRenewResult {
                    case .failure(let error):
                        chain.handleErrorAsync(error,
                                               request: request,
                                               response: response,
                                               completion: completion)
                    case .success(let token):
                        self.addTokenAndProceed(token,
                                                to: request,
                                                chain: chain,
                                                response: response,
                                                completion: completion)
                    }
                }
            } else {
                self.addTokenAndProceed(token,
                                        to: request,
                                        chain: chain,
                                        response: response,
                                        completion: completion)
            }
        }
    }
    
    class RequestLoggingInterceptor: ApolloInterceptor {
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            Logger.log(.debug, "Outgoing request: \(request)")
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
    }
    
    class ResponseLoggingInterceptor: ApolloInterceptor {
        
        enum ResponseLoggingError: Error {
            case notYetReceived
        }
        
        func interceptAsync<Operation: GraphQLOperation>(
            chain: RequestChain,
            request: HTTPRequest<Operation>,
            response: HTTPResponse<Operation>?,
            completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            defer {
                // Even if we can't log, we still want to keep going.
                chain.proceedAsync(request: request,
                                   response: response,
                                   completion: completion)
            }
            
            guard let receivedResponse = response else {
                chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            
            Logger.log(.debug, "HTTP Response: \(receivedResponse.httpResponse)")
            
            if let stringData = String(bytes: receivedResponse.rawData, encoding: .utf8) {
                Logger.log(.debug, "Data: \(stringData)")
            } else {
                Logger.log(.error, "Could not convert data to string!")
            }
        }
    }
}
