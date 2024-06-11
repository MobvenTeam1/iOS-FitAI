import SwiftUI

struct FMPLoginWithNumberButton: View {
    var body: some View {
        NavigationLink {
            ForgotMyPasswordWithNumber()
        }label: {
                Text("E-postanız doğru değil mi? **Numarayla Giriş Yap**")
        }
        .font(.urbanistRegular(size: 15))
        .foregroundStyle(Color.black26_27)
    }
}

#Preview {
    FMPLoginWithNumberButton()
}
