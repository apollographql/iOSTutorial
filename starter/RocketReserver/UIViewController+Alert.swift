//
//  UIViewController+Alert.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 12/7/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit

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
    
    // TODO: Add a method to show an alert with GraphQL Errors
}
