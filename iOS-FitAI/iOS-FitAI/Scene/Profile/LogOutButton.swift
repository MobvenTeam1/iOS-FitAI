import SwiftUI

struct LogOutButton: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationLink {
            LoginView()
        }label: {
            ZStack {
                Color.white
                    .frame(width: 327, height: 56)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 40, x: 2, y: 2)
                Text("Çıkış Yap")
                    .font(.urbanistSemibold(size: 16))
                    .foregroundStyle(Color.black11_11)
            }
            .padding(.leading, 24)
        }
    }
}

#Preview {
    LogOutButton()
}
