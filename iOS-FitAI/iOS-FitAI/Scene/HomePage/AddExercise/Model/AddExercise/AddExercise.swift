//
//  AddExercise.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 6.06.2024.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let secondaryText: String
    let imageName: String
}

extension Exercise {
    static let exercises = [
        Exercise(name: "Yürüyüş", secondaryText: "Düşük Tempo - 1 saatte 65 kcal", imageName: "yürüyüş"),
        Exercise(name: "Koşu", secondaryText: "1 saatte 178 kcal", imageName: "koşu"),
        Exercise(name: "Bisiklet", secondaryText: "1 saatte 325 kcal", imageName: "bisiklet"),
        Exercise(name: "Yüzme", secondaryText: "1 saatte 350 kcal", imageName: "yüzme"),
        Exercise(name: "Tenis", secondaryText: "1 saatte 280 kcal", imageName: "tenis")
    ]
}
