import SwiftUI

struct DividerWithText: View {
    var body: some View {
        HStack(alignment: .center) {
            Color.gray.opacity(0.2)
                .frame(width: 75, height: 1)
            Text("Veya Şununla Giriş Yapın")
                .font(.urbanistSemibold(size: 14))
                .foregroundStyle(Color.black102_102)
            Color.black230_230
                .frame(width: 75, height: 1)
        }
        .frame(maxWidth: .infinity)
            .padding(.top, 20)
    }
}

#Preview {
    DividerWithText()
}
