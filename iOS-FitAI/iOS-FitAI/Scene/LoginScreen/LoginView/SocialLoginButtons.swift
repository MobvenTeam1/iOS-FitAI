import SwiftUI

struct SocialLoginButtons: View {
    var body: some View {
        HStack {
            Image("facebook")
            Image("googlegiriş")
            Image("Apple")
        }
        .padding(.top, 12)
    }
}

#Preview {
    SocialLoginButtons()
}
