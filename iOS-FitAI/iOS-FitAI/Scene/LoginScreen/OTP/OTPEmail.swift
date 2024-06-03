import SwiftUI

struct OTPEmail: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Doğrulama")
                    .font(.urbanistBold(size: 30))
                    .foregroundStyle(Color.black11_11)
                    .padding(.top, 28)
                Text("E-posta adresinize gönderdiğimiz doğrulama kodunu girin.")
                    .foregroundStyle(Color.black102_102)
                    .font(.urbanistMedium(size: 16))
                OTPTextField(numberOfFields: 4)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 22)
                CountdownTimerView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 22)
            .customLogoButton()
            .customBackButton()
        }
    }
}

#Preview {
    OTPEmail()
        .environmentObject(AppState())
}
