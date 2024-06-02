import SwiftUI

struct FMPEmailTextView: View {
    var body: some View {
        Text("Şifrenizi mi unuttunuz?")
            .font(.urbanistBold(size: 30))
            .foregroundStyle(Color.black11_11)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 33)
            .padding(.top, 28)
        Text("Endişelenmeyin! Hesabınızla bağlantılı\ne-posta adresini girin")
            .font(.urbanistMedium(size: 16))
            .foregroundStyle(Color.black102_102)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 33)
    }
}

#Preview {
    FMPEmailTextView()
}
