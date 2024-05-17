import SwiftUI

struct NotificationView: View {
    var message: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 10)
                Text(message)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Spacer(minLength: 10)
            }
            .padding(10)
            .background(.black.opacity(0.8))
            .cornerRadius(8)
        }
        .padding(.horizontal, 16)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(message: "This is the message.")
    }
}

struct NotificationViewModifier: ViewModifier {
    @Binding var message: String?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainNotificationView()
                        .offset(y: -30)
                }
                .animation(.spring(), value: message)
            )
            .onChange(of: message) {
                showNotification()
            }
    }
    
    @ViewBuilder func mainNotificationView() -> some View {
        if let message = message {
            VStack {
                Spacer()
                NotificationView(message: message)
            }
            .transition(.move(edge: .bottom))
        }
    }
    
    private func showNotification() {
        workItem?.cancel()
        
        let task = DispatchWorkItem {
            dismissNotification()
        }
        
        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
    }
    
    private func dismissNotification() {
        withAnimation {
            message = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

extension View {
    func notificationView(message: Binding<String?>) -> some View {
        self.modifier(NotificationViewModifier(message: message))
    }
}
