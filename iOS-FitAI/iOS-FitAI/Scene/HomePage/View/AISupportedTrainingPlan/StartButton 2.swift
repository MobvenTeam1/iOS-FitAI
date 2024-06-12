import SwiftUI

struct StartButton: View {
    @Binding var showAnimation: Bool
    @StateObject var homePageViewModel = HomePageViewModel()
    var body: some View {
        GreenButtonView(text: "Başla") {
            showAnimation = true
                Task {
                    await homePageViewModel.getTraining()
                }
        }
    }
}
