import SwiftUI

struct StartButton: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    var body: some View {
        GreenButtonView(text: "Başla") {
            coordinator.show(.exerciseProgramQuestions)
        }
    }
}

struct StartButtonForFood: View {
    @Binding var showAnimation: Bool
    var body: some View {
        GreenButtonView(text: "Başla") {
                showAnimation = true
        }
    }
}
