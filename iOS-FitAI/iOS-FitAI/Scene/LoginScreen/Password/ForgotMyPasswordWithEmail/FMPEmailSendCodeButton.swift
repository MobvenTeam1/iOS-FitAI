import SwiftUI

struct FMPEmailSendCodeButton: View {
    var body: some View {
        NavigationLink {
            OTPEmail()
        }label: {
            ZStack {
                Color.green177_235
                    .frame(width: 327, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text("Kod Gönder")
                    .foregroundStyle(Color.green177_235)
                    .font(.urbanistSemibold(size: 16))
            }
        }
    }
}

#Preview {
    FMPEmailSendCodeButton()
}
