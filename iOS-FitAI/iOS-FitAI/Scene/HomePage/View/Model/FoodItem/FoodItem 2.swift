//
//  FoodItem.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    var name: String
    var imageName: String?
    var secondaryText: String
}
