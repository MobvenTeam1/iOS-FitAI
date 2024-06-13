//
//  AddExercise.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 7.06.2024.
//

import Foundation
import SwiftData

@Model
class Exercise {
    @Attribute(.unique) var id = UUID()
    let name: String
    let secondaryText: String
    let imageName: String
    let calorie: String
    var duration: String
    init(id: UUID = UUID(), name: String, secondaryText: String, imageName: String, calorie: String, duration: String) {
        self.id = id
        self.name = name
        self.secondaryText = secondaryText
        self.imageName = imageName
        self.calorie = calorie
        self.duration = duration
    }
}

extension Exercise {
    static let exercises = [
        Exercise(name: "Yürüyüş", secondaryText: "Düşük Tempo - 1 saatte 65 kcal", imageName: "addwalking", calorie: "65", duration: ""),
        Exercise(name: "Koşu", secondaryText: "1 saatte 178 kcal", imageName: "addrunning", calorie: "178", duration: ""),
        Exercise(name: "Bisiklet", secondaryText: "1 saatte 325 kcal", imageName: "addbicycle", calorie: "325", duration: ""),
        Exercise(name: "Yüzme", secondaryText: "1 saatte 350 kcal", imageName: "addswimming", calorie: "350", duration: ""),
        Exercise(name: "Tenis", secondaryText: "1 saatte 280 kcal", imageName: "addtennis", calorie: "280", duration: "")
    ]
}

@MainActor
final class MyModelViewModel: SwiftDataViewModel<Exercise, GenericDataSource<Exercise>> {
    init() {
        let dataSource = GenericDataSource<Exercise>()
        super.init(dataSource: dataSource)
    }
}
