import SwiftUI

struct TripBadgeView : View {

    private let size = 16.0
    private let x = 20.0
    private let y = 0.0

    @StateObject private var viewModel = TripsBadgeViewModel()

    var body: some View {
        ZStack {
            Capsule()
            .fill(.red)
            .frame(width: size * widthMultplier(), height: size, alignment: .topTrailing)
            .position(x: x, y: y)

            Text("\(viewModel.count)")
            .foregroundColor(.white)
            .font(Font.caption)
            .position(x: x, y: y)
        }
        .task {
            viewModel.loadUserTrips()
        }
    }

    func widthMultplier() -> Double {
        let value = viewModel.count

        if value < 10 {
            return 1.0
        } else if value < 100 {
            return 1.5
        } else {
            return 2.0
        }
    }
}
