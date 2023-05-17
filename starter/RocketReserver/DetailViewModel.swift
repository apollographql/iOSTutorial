import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init() {
        // TODO (Section 9 - https://www.apollographql.com/docs/ios/tutorial/tutorial-complete-details-view#execute-the-query)
    }
    
    func loadLaunchDetails() {
        // TODO (Section 9 - https://www.apollographql.com/docs/ios/tutorial/tutorial-complete-details-view#execute-the-query)
    }
    
    func bookOrCancel() {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
        
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-canceltrip-logic)
    }
    
    private func bookTrip() {
        print("Book Trip!")
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-booktrip-logic)
    }
    
    private func cancelTrip() {
        print("Cancel Trip!")
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-canceltrip-logic)
    }
    
    private func isLoggedIn() -> Bool {
        // TODO (Section 10 - https://www.apollographql.com/docs/ios/tutorial/tutorial-first-mutation#display-the-login-view)
        return false
    }
    
}
