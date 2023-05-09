//
//  DetailViewModel.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/27/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init() {
        // TODO
    }
    
    func loadLaunchDetails() {
        // TODO
    }
    
    func bookOrCancel() {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
        
        // TODO
    }
    
    private func bookTrip() {
        print("Book Trip!")
        // TODO
    }
    
    private func cancelTrip() {
        print("Cancel Trip!")
        // TODO
    }
    
    private func isLoggedIn() -> Bool {
        // TODO
        return false
    }
    
}
