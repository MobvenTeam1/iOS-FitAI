import SwiftUI

struct InitialView: View {
    @Binding var showAnimation: Bool
    var firstText: String
    var secondText: String
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Circle()
                .frame(width: 176, height: 176)
                .foregroundStyle(Color.gray232_232)
                .padding(.bottom, 26)
            Text(firstText)
                .font(.urbanistBold(size: 26))
                .foregroundStyle(Color.black11_11)
            Text(secondText)
                .font(.urbanistMedium(size: 15))
                .foregroundStyle(Color.black102_102)
            Spacer()
            StartButton(showAnimation: $showAnimation)
                .padding(.top, 20)
        }
        .padding(.top, 217)
        .multilineTextAlignment(.center)
        .navigationBarHidden(true)
    }
}
