//
//  LaunchRow.swift
//  RocketReserver
//
//  Created by Zach FettersMoore on 4/27/23.
//  Copyright © 2023 Apollo GraphQL. All rights reserved.
//

import RocketReserverAPI
import SDWebImageSwiftUI
import SwiftUI

struct LaunchRow: View {
    let launch: LaunchListQuery.Data.Launches.Launch
    private let placeholderImg = Image("placeholder")
    
    var body: some View {
        HStack {
            if let missionPatch = launch.mission?.missionPatch {
                WebImage(url: URL(string: missionPatch))
                    .resizable()
                    .placeholder(placeholderImg)
                    .indicator(.activity)
                    .frame(width: 50, height: 50)
            } else {
                placeholderImg
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(launch.mission?.name ?? "Mission Name")
                Text(launch.site ?? "Launch Site")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .padding(4)
    }
}
