import RocketReserverAPI
import SDWebImageSwiftUI
import SwiftUI

struct DetailView: View {
    private let placeholderImg = Image("placeholder")
    
    @StateObject private var viewModel: DetailViewModel
    @State private var isShowingUser = false

    init(launchID: RocketReserverAPI.ID) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(launchID: launchID))
    }
    
    var body: some View {
        VStack {
            if let launch = viewModel.launch {
                HStack(spacing: 10) {
                    if let missionPatch = launch.mission?.missionPatch {
                        WebImage(url: URL(string: missionPatch))
                            .resizable()
                            .placeholder(placeholderImg)
                            .indicator(.activity)
                            .scaledToFit()
                            .frame(width: 165, height: 165)
                    } else {
                        placeholderImg
                            .resizable()
                            .scaledToFit()
                            .frame(width: 165, height: 165)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if let missionName = launch.mission?.name {
                            Text(missionName)
                                .font(.system(size: 24, weight: .bold))
                        }
                        
                        if let rocketName = launch.rocket?.name {
                            Text("🚀 \(rocketName)")
                                .font(.system(size: 18))
                        }
                        
                        if let launchSite = launch.site {
                            Text(launchSite)
                                .font(.system(size: 14))
                        }
                    }
                    
                    Spacer()
                }
                
                if launch.isBooked {
                    cancelTripButton()
                } else {
                    bookTripButton()
                }
            }
            Spacer()
        }
        .padding(10)
        .navigationTitle(viewModel.launch?.mission?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: { }, label: {
                Image(systemName: "person.circle")
                .overlay(
                    TripBadgeView()
                )
            })
            .disabled(true)
        }
        .task {
            viewModel.loadLaunchDetails()
        }
        .sheet(isPresented: $viewModel.isShowingLogin) {
            LoginView(isPresented: $viewModel.isShowingLogin)
        }
        .appAlert($viewModel.appAlert)
    }
    
    private func bookTripButton() -> some View {
        Button(action: viewModel.bookOrCancel) {
            Text("Book now!")
                .foregroundColor(.black)
        }
        .frame(width: 200, height: 50)
        .background(.green)
        .cornerRadius(8)
    }
    
    private func cancelTripButton() -> some View {
        Button(action: viewModel.bookOrCancel) {
            Text("Cancel trip")
                .foregroundColor(.black)
        }
        .frame(width: 200, height: 50)
        .background(.red)
        .cornerRadius(8)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(launchID: "110")
    }
}
