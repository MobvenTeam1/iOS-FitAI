//
//  AppState.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isLoginSuccessful: Bool = false
    @Published var selectedIndex: Int = 0
    @Published var isTrainingPlanned: Bool = false
    @Published var isTrainingTapped: Bool = false
    @Published var isNutritionPlanned: Bool = false
    @Published var isNutritionTapped: Bool = false
    @Published  var isOTPCorrect: Bool? = nil
    @Published var number: String = ""
    
}
