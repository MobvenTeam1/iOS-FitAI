import SwiftUI

struct FMPLoginWithEmailButton: View {
    var body: some View {
        NavigationLink {
            ForgotMyPasswordWithEmail()
        }label: {
                Text("Numaranız doğru değil mi? **Epostayla Giriş Yap**")
        }
        .font(.urbanistRegular(size: 15))
        .foregroundStyle(Color.black26_27)
    }
}

#Preview {
    FMPLoginWithEmailButton()
}
