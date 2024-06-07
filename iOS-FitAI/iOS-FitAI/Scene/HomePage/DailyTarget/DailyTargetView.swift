//
//  DailyTargetView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct DailyTargetView: View {
    @State private var kgLeftToTarget: Int = 5
    @State private var addExercise: Bool = false
    @State private var addFood: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Günlük Hedefler")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black29_30)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            HStack(spacing: 8) {
                DailyTargetButtonsView(imageName: "egzersiz", text: "Egzersiz Ekle") {
                    addExercise = true
                }
                DailyTargetButtonsView(imageName: "besin", text: "Besin Ekle") {
                    addFood = true
                }
            }
            CircularProgressView(totalKgToLose: 10, kgToLoseForTarget: 5)
            Text("Hedefe kalan: \(kgLeftToTarget) kg")
            HStack(spacing: 8) {
                CaloriesView(imageName: "alınan", firstText: "Alınan Kalori", calorieText: "950 cal")
                CaloriesView(imageName: "harcanan", firstText: "Harcanan Kalori", calorieText: "1300 cal")
                CaloriesView(imageName: "günlükkalori", firstText: "Günlük Hedef", calorieText: "2500 cal")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 33)
        }
        .padding(.top, 20)
        .navigationDestination(isPresented: $addExercise) {
            AddExerciseView()
        }
        .navigationDestination(isPresented: $addFood) {
            AddFoodView()
        }
    }
}
