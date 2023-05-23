import SwiftUI

struct DetailView: View {
    private let placeholderImg = Image("placeholder")
    
    @StateObject private var viewModel: DetailViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: DetailViewModel())
    }
    
    var body: some View {
        VStack {
            if let launch = Optional("PLACEHOLDER") {
                HStack(spacing: 10) {
                    placeholderImg
                        .resizable()
                        .scaledToFit()
                        .frame(width: 165, height: 165)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if let missionName = Optional("Mission Name") {
                            Text(missionName)
                                .font(.system(size: 24, weight: .bold))
                        }
                        
                        if let rocketName = Optional("Rocket Name") {
                            Text("🚀 \(rocketName)")
                                .font(.system(size: 18))
                        }
                        
                        if let launchSite = Optional("Launch Site") {
                            Text(launchSite)
                                .font(.system(size: 14))
                        }
                    }
                    
                    Spacer()
                }
                
                if launch == "PLACEHOLDER" {
                    cancelTripButton()
                } else {
                    bookTripButton()
                }
            }
            Spacer()
        }
        .padding(10)
        .navigationTitle("Mission Name")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            
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
        DetailView()
    }
}
