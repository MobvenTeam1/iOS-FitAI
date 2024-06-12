//
//  NutritionPlanningView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct NutritionPlanningView: View {
    @Binding var foodItems: [FoodItem]
    @State private var isChangeSuggestionTapped: Bool = false
    @State private var selectedFoodName: String = ""
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 12) {
            Text("Besinler")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black26_27)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 52)
            VStack(spacing: 8) {
                ForEach(foodItems.indices, id: \.self) { index in
                    ZStack {
                        Color.white
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 1, y: 1)
                        HStack {
                            if let imageName = foodItems[index].imageName {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 36, height: 35)
                            }
                            else {
                                Color.white247_248
                                    .frame(width: 36, height: 35)
                            }
                            VStack(alignment: .leading) {
                                Text(foodItems[index].name)
                                    .font(.urbanistBold(size: 16))
                                    .foregroundStyle(.black)
                                Text(foodItems[index].secondaryText)
                                    .font(.urbanistRegular(size: 14))
                            }
                            Spacer()
                            Button {
                                selectedFoodName = foodItems[index].name
                                appState.updateFoodTargetIndex = index
                                isChangeSuggestionTapped = true
                            } label: {
                                Image("setlerimage")
                            }
                            .sheet(isPresented: $isChangeSuggestionTapped) {
                                                            AIUpdateFoodSuggestion(
                                                                selectedFoodName: selectedFoodName,
                                                                foodItems: [
                                                                    FoodItem(name: "Muz", imageName: "muz", secondaryText: "1 tane orta, 180 kcal"),
                                                                    FoodItem(name: "Fıstık Ezmesi", imageName: "fıstıkezmesi", secondaryText: "2 kaşık, 180 kcal"),
                                                                    FoodItem(name: "Kinoa", imageName: "kinoa", secondaryText: "200gr, 180 kcal"),
                                                                    FoodItem(name: "Keten Tohumu", imageName: "ketentohumu", secondaryText: "2 kaşık, 180 kcal")
                                                                ]
                                                            )
                                                            .presentationDetents([.large, .fraction(0.7)])
                                                        }
                        }
                        .padding()
                    }
                    .frame(width: 287, height: 82)
                }
            }
            .padding(.horizontal, 16)
        }
        .onChange(of: appState.isUserUpdateFood) { isUserUpdateFood in
                    if isUserUpdateFood, let index = appState.selectedFoodIndex, let updatedItem = appState.updatedFoodItem,
                       index < foodItems.count {
                        appState.isUserUpdateFood = false
                        foodItems[index] = updatedItem
                    }
                }
    }
}
