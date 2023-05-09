//
//  LaunchListView.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/27/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import SwiftUI

struct LaunchListView: View {
    
    @StateObject private var viewModel = LaunchListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    LaunchRow()
                }
            }
            .task {
                // TODO
            }
            .navigationTitle("Rocket Launches")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
