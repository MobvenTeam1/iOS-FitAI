//
//  AISupportedTrainingPlan.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct AISupportedTrainingPlan: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAnimation = false

    var body: some View {
        ZStack {
            if showAnimation {
                AnimatedStarView(dismiss: dismiss)
            } else {
                InitialView(showAnimation: $showAnimation,
                            firstText: "AI Destekli\nAntrenman Planı",
                            secondText: "Size özel antrenman planınızı oluşturmamız için kişisel bilgilerinize ihtiyacımız var.\nLütfen soruları cevaplayın.")
            }
        }
        .padding(.bottom, 40)
        .toolbar(.hidden)
    }
}

#Preview {
    AISupportedTrainingPlan()
}
