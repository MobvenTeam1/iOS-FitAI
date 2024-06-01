import SwiftUI

struct ForgotPasswordLink: View {
    var body: some View {
        NavigationLink {
            ForgotMyPasswordWithNumber()
        }label: {
            Text("Şifremi Unuttum")
                .font(.urbanistSemibold(size: 14))
                .foregroundStyle(Color.black102_102)
                .padding(.trailing, 16)
        }
    }
}

#Preview {
    ForgotPasswordLink()
}
