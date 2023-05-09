//
//  AuthorizationInterceptor.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/28/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import Foundation
import Apollo
import ApolloAPI
import KeychainSwift

class AuthorizationInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        let keychain = KeychainSwift()
        if let token = keychain.get(LoginView.loginKeychainKey) {
            request.addHeader(name: "Authorization", value: token)
        }
        
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
    
}
