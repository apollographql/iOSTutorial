import SwiftUI
import RocketReserverAPI
import SDWebImageSwiftUI

struct LaunchRow: View {
    let launch: LaunchListQuery.Data.Launches.Launch
    private let placeholderImg = Image("placeholder")
    
    var body: some View {
        HStack {
            if let missionPatch = launch.mission?.missionPatch {
                WebImage(url: URL(string: missionPatch)) { image in
                    image.resizable()
                } placeholder: {
                    placeholderImg.resizable()
                }
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 50, height: 50)
            } else {
                placeholderImg
                    .resizable()
                    .scaledToFit()
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
