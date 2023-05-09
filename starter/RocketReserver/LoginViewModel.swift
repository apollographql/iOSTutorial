//
//  LoginViewModel.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/27/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Binding var isPresented: Bool
    @Published var isSubmitEnabled: Bool = true
    @Published var errorText: String?
    @Published var appAlert: AppAlert?
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func login(with email: String?) {
        errorText = nil
        isSubmitEnabled = false
        
        guard let email = email, !email.isEmpty else {
            errorText = "Please enter an email address."
            isSubmitEnabled = true
            return
        }
        
        guard validate(email: email) else {
            errorText = "Please enter a valid email"
            isSubmitEnabled = true
            return
        }
        
        // TODO
    }
    
    private func validate(email: String) -> Bool {
        // we assume that the email is valid at first
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
    
}
