//
//  LoginViewController.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 11/25/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit

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
        
        // TODO: Actually log the user in
    }
    
    private func validate(email: String) -> Bool {
        // we assume that the email is valid at first, at we'll try to find if it's not
        var returnValue = true
        let emailRegEx = #"^\S+@\S+\.\S+$"#
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
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

