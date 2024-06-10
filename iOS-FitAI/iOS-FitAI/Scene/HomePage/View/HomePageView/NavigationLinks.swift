import SwiftUI

struct NavigationLinks: View {
    @Binding var goToTrainingAIPage: Bool
    @Binding var goToNutritionAIPage: Bool

    var body: some View {
        VStack {
            NavigationLink(destination: AISupportedTrainingPlan(), isActive: $goToTrainingAIPage) {
                EmptyView()
            }
            NavigationLink(destination: AISupportedNutritionPlan(), isActive: $goToNutritionAIPage) {
                EmptyView()
            }
        }
    }
}
