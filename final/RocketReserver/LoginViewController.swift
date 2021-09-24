//
//  LoginViewController.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 11/25/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit
import KeychainSwift

class LoginViewController: UIViewController {
    
    static let loginKeychainKey = "login"
    
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var errorLabel: UILabel!
    @IBOutlet private var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = nil
        self.enableSubmitButton(true)
    }
    
    @IBAction private func cancelTapped() {
        self.dismiss(animated: true)
    }
    
    @IBAction private func submitTapped() {
        self.errorLabel.text = nil
        self.enableSubmitButton(false)
        guard let email = self.emailTextField.text else {
            self.errorLabel.text = "Please enter an email address."
            self.enableSubmitButton(true)
            return
        }
        
        guard self.validate(email: email) else {
            self.errorLabel.text = "Please enter a valid email."
            self.enableSubmitButton(true)
            return
        }
        
        Network.shared.apollo.perform(mutation: LoginMutation(email: email)) { [weak self] result in
            defer {
                self?.enableSubmitButton(true)
            }

            switch result {
            case .success(let graphQLResult):
                if let token = graphQLResult.data?.login {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: LoginViewController.loginKeychainKey)
                    self?.dismiss(animated: true)
                }
                
                if let errors = graphQLResult.errors {
                    print("Errors from server: \(errors)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func validate(email: String) -> Bool {
        return email.contains("@")
    }
    
    private func enableSubmitButton(_ isEnabled: Bool) {
        self.submitButton.isEnabled = isEnabled
        if isEnabled {
            self.submitButton.setTitle("Submit", for: .normal)
        } else {
            self.submitButton.setTitle("Submitting...", for: .normal)
        }
    }
}

