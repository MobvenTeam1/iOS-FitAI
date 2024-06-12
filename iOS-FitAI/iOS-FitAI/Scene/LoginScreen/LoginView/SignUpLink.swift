import SwiftUI

struct SignUpLink: View {
    var body: some View {
        NavigationLink {
            RegisterView()
        }label: {
            Text("Hesabın yok mu? ")
                .font(.urbanistMedium(size: 15)) +
            Text("Kayıt Ol")
                .font(.urbanistBold(size: 15))
            
        }
        .padding(.top, 46)
        .padding(.bottom, 26)
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundStyle(Color.black)
    }
}

#Preview {
    SignUpLink()
}
