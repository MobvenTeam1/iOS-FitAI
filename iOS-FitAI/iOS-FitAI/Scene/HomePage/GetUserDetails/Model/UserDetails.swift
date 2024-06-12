//
//  UserDetails.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 11.06.2024.
//

import Foundation

struct UserDetails: Codable {
    let gender: String?
    let height, firstWeight: Int?
    let dateOfBirth: String?
    let currentWeight, targetWeight: Int?
    let goals, preferredActivities, workoutFrequency, focusAreas: String?
    let healthProblem: String?
    let basalMetabolism, dailyKcalGoal: Int?
}
