//
//  AIFoodSuggestionView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 4.06.2024.
//

import SwiftUI

struct AIUpdateFoodSuggestion: View {
    let selectedFoodName: String
    let foodItems: [FoodItem]
    @State private var selectedFoodIndex: Int? = nil
    var body: some View {
        VStack {
            HeaderView(selectedFoodName: selectedFoodName)
            FoodDetailsView(foodItems: foodItems, selectedFoodIndex: $selectedFoodIndex)
            .padding(.horizontal, 16)
            UpdateButton(selectedFoodIndex: $selectedFoodIndex, foodItems: foodItems)
            .padding(.top, 12)
        }
    }
}
