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

struct FitnessAntrenman: Codable {
    let day: String?
    let program: [String: String]?
}
