//
//  NetworkInterceptorProvider.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/28/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import Foundation
import Apollo
import ApolloAPI

class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
    
}

