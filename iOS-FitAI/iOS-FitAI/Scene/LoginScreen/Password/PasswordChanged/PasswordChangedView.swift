import SwiftUI

struct PasswordChangedView: View {
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .center, spacing: 8) {
                Spacer()
                PasswordChangedImageAndText()
                Spacer()
                PasswordChangedLoginButton()
            }
            .toolbar(.hidden)
        }
    }
}

#Preview {
    PasswordChangedView()
}

