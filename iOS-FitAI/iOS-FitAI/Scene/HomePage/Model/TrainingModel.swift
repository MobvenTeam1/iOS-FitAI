//
//  TrainingModel.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 10.06.2024.
//

import Foundation
 struct TrainingModel: Codable {
   
    let fitnessAntrenman: [FitnessAntrenman]?
    
    enum CodingKeys: String, CodingKey {
        case fitnessAntrenman = "fitness_antrenman"
    }
}

// MARK: - FitnessAntrenman
struct FitnessAntrenman: Codable, Identifiable {
    var id = UUID()
    let day: String?
    let program: Program?
}

// MARK: - Program
struct Program: Codable {
    let exercise1, exercise2, exercise3, exercise4: String?
    let exercise5, exercise6: String?
    
    enum CodingKeys: String, CodingKey {
        case exercise1 = "exercise_1"
        case exercise2 = "exercise_2"
        case exercise3 = "exercise_3"
        case exercise4 = "exercise_4"
        case exercise5 = "exercise_5"
        case exercise6 = "exercise_6"
    }
}
