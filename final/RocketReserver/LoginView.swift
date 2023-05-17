import SwiftUI

struct LoginView: View {
    static let loginKeychainKey = "login"
    
    @State private var email: String = ""
    @StateObject var viewModel: LoginViewModel
    
    init(isPresented: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(isPresented: isPresented))
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                HStack {
                    Button {
                        viewModel.isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .padding([.top, .leading], 20)
                    Spacer()
                }
                
                Text("Login")
                    .font(.system(size: 36, weight: .semibold))
                    .padding(.top, 60)
                
                TextField("Email address", text: $email)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                
                Button(viewModel.isSubmitEnabled ? "Submit" : "Submitting...") {
                    viewModel.login(with: email)
                }
                .disabled(!viewModel.isSubmitEnabled)
                
                if let errorText = viewModel.errorText {
                    Text(errorText)
                }
                
                Spacer()
            }
        }
        .appAlert($viewModel.appAlert)
    }
    
}
