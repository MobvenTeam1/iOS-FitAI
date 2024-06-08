//
//  AddExercise.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 7.06.2024.
//

import Foundation

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let secondaryText: String
    let imageName: String
    
}

extension Exercise {
    static let exercises = [
        Exercise(name: "Yürüyüş", secondaryText: "Düşük Tempo - 1 saatte 65 kcal", imageName: "addwalking"),
        Exercise(name: "Koşu", secondaryText: "1 saatte 178 kcal", imageName: "addrunning"),
        Exercise(name: "Bisiklet", secondaryText: "1 saatte 325 kcal", imageName: "addbicycle"),
        Exercise(name: "Yüzme", secondaryText: "1 saatte 350 kcal", imageName: "addswimming"),
        Exercise(name: "Tenis", secondaryText: "1 saatte 280 kcal", imageName: "addtennis")
    ]
}
