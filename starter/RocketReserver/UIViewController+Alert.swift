//
//  UIViewController+Alert.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 12/7/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit
import Apollo

extension UIViewController {
    
    /// Shows an alert with the given title and message and an "OK" button to dismiss
    ///
    /// - Parameters:
    ///   - title: The title to display
    ///   - message: The message to display
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    /// Shows an alert with the given GraphQL Errors
    ///
    /// - Parameter errors: An array of GraphQL errors.
    func showAlertForErrors(_ errors: [GraphQLError]) {
        let message = errors
          .map { $0.localizedDescription }
          .joined(separator: "\n")
        self.showAlert(title: "GraphQL Error(s)", message: message)
      }
}
