import SwiftUI

struct OTPNumber: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Doğrulama")
                    .font(.urbanistBold(size: 30))
                    .foregroundStyle(Color.gray30_35)
                    .padding(.top, 28)
                Text(appState.number)
                    .font(.urbanistMedium(size: 16))
                    .foregroundStyle(Color.black102_102) +
                Text(" nolu numaranıza gönderdiğimiz doğrulama kodunu girin.")
                    .font(.urbanistMedium(size: 16))
                    .foregroundStyle(Color.black102_102)
                OTPTextField(numberOfFields: 4)
                    .padding(.top, 22)
                CountdownTimerView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 22)
            .customLogoButton()
            .customBackButton()
        }
        .onDisappear {
            appState.number = ""
        }
    }
}

#Preview {
    OTPNumber()
        .environmentObject(AppState())
}
