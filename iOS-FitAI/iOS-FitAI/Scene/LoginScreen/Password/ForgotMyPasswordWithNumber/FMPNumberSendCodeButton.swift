import SwiftUI

struct FMPNumberSendCodeButton: View {
    var body: some View {
        NavigationLink {
            OTPNumber()
        }label: {
            ZStack {
                Color.green177_235
                    .frame(width: 327, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text("Kod Gönder")
                    .foregroundStyle(Color.black11_11)
                    .font(.urbanistSemibold(size: 16))
            }            
        }
    }
}

#Preview {
    FMPNumberSendCodeButton()
}
