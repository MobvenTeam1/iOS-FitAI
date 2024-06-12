import SwiftUI

struct WelcomeTextView: View {
    var body: some View {
        Text("Hoşgeldin!")
            .font(.urbanistBold(size: 30))
            .foregroundStyle(Color.black11_11)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 28)
            .padding(.leading, 8)
        Text("Seni tekrar aramızda gördüğümüze sevindik")
            .font(.urbanistMedium(size: 16))
            .foregroundStyle(Color.black102_102)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 22)
            .padding(.leading, 8)
    }
}

#Preview {
    LoginView()
}
