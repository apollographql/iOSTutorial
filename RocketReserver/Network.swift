//
//  Network.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 11/13/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import Foundation
import Apollo
import KeychainSwift

class Network {
  static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        let httpNetworkTransport = HTTPNetworkTransport(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!)
        httpNetworkTransport.delegate = self
        return ApolloClient(networkTransport: httpNetworkTransport)
    }()
}

extension Network: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport,         shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {
        let keychain = KeychainSwift()
        if let token = keychain.get(LoginViewController.loginKeychainKey) {
            request.addValue(token, forHTTPHeaderField: "Authorization")
        } // else do nothing
    }
}
