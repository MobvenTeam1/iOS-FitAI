//
//  AISupportedNutritionPlan.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct AISupportedNutritionPlan: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAnimation = false

    var body: some View {
        ZStack {
            if showAnimation {
                AnimatedStarView()
            } else {
                InitialViewForFood(showAnimation: $showAnimation,
                            firstText: "AI Destekli\nBeslenme Planı",
                            secondText: "Size özel beslenme planınızı oluşturmamız için kişisel bilgilerinize ihtiyacımız var.\nLütfen soruları cevaplayın.")
            }
        }
        .padding(.bottom, 40)
        .toolbar(.hidden)
    }
}
