//
//  View+Alert.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/28/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import Apollo
import SwiftUI

enum AppAlert {
    case basic(title: String, message: String)
    case errors(errors: [Error])
    
    var title: String {
        switch self {
        case .basic(let title, _): return title
        case .errors(_): return "GraphQL Error(s)"
        }
    }
    
    var message: String {
        switch self {
        case .basic(_, let message): return message
        case .errors(let errors):
            let message = errors.map { $0.localizedDescription }.joined(separator: "\n")
            return message
        }
    }
}

extension View {
    
    func appAlert(_ appAlert: Binding<AppAlert?>) -> some View {
        let alertType = appAlert.wrappedValue
        return alert(Text(alertType?.title ?? ""), isPresented: .constant(alertType != nil)) {
            Button("OK") {
                appAlert.wrappedValue = nil
            }
        } message: {
            Text(alertType?.message ?? "")
        }
    }
    
}
