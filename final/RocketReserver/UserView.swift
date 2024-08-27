import SwiftUI

struct UserView: View {

    @StateObject private var viewModel: UserViewModel

    init() {
        _viewModel = StateObject(wrappedValue: UserViewModel())
    }

    var body: some View {
        NavigationStack {
            List {
                if let trips = viewModel.trips {
                    ForEach(0..<trips.count, id: \.self) { index in
                        NavigationLink(destination: DetailView(launchID: trips[index].id)) {
                            LaunchRow(launch: trips[index].fragments.launchListDetail)
                        }
                    }
                }
            }
            .task {
                viewModel.loadTrips()
            }
            .navigationTitle("Booked Trips")
            .appAlert($viewModel.appAlert)
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    UserView()
}
