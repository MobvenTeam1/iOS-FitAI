import SwiftUI

struct EmailTextField: View {
    @Binding var showError: Bool
    @Binding var errorMessage: String
    @Binding var email: String
    var body: some View {
        VStack {
            TextField("", text: $email)
                .placeholder(when: email.isEmpty, placeholder: {
                    Text("E-posta")
                })
                .padding(.leading, 18)
                .frame(width: 327, height: 56)
                .background(Color.white247_248)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray232_232, lineWidth: 1)
                )
                .textInputAutocapitalization(.none)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            if showError {
                Text(errorMessage)
                    .font(.urbanistRegular(size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.red)
                    .padding(.leading, 20)
            }
        }
    }
}

#Preview {
    LoginView()
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            .foregroundStyle(Color.black102_102)
            .font(.urbanistMedium(size: 16))
            self
        }
    }
}
