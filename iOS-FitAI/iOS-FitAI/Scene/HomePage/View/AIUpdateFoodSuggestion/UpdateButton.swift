import SwiftUI

struct UpdateButton: View {
    @Binding var selectedFoodIndex: Int?
    let foodItems: [FoodItem]
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss

    var body: some View {
        GreenButtonView(text: "Öğünümü Güncelle") {
            if let selectedIndex = selectedFoodIndex, let targetIndex = appState.updateFoodTargetIndex,
               selectedIndex < foodItems.count {
                appState.selectedFoodIndex = targetIndex
                appState.updatedFoodItem = foodItems[selectedIndex]
                appState.isUserUpdateFood = true
            }
            dismiss()
        }
    }
}
