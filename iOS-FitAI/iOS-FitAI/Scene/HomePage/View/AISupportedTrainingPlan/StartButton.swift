import SwiftUI

struct StartButton: View {
    @Binding var showAnimation: Bool
    @StateObject var homePageViewModel = HomePageViewModel()
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    var body: some View {
        GreenButtonView(text: "Başla") {
//            coordinator.show(.exerciseProgramView)
                showAnimation = true
        }
    }
}
