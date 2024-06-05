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
