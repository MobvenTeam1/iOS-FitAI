//
//  AppState.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

final class AppState: ObservableObject {
    static let shared = AppState()
    @Published var isLoginSuccessful: Bool = false
    @Published var selectedIndex: Int = 0 // use it for tabBar
    @Published var isTrainingPlanned: Bool = false //appstorage dene
    @Published var isTrainingTapped: Bool = false
    @Published var isNutritionPlanned: Bool = false
    @Published var isNutritionTapped: Bool = false
    @Published  var isOTPCorrect: Bool? = nil
    @Published var number: String = "" // use it for gsmnumber
    @Published var isUserUpdateFood = false
    @Published var selectedFoodIndex: Int? = nil
    @Published var updateFoodTargetIndex: Int? = nil
    @Published var updatedFoodItem: FoodItem? = nil
    @Published var isaddExerciseButtonTapped: Bool = false
    
    @Published var userName: String = ""
    //a
    @Published var showAnimation: Bool = false
    //b
}
