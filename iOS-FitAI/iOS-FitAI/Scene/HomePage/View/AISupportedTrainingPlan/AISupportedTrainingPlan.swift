//
//  AISupportedTrainingPlan.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct AISupportedTrainingPlan: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject var exerciseVM = ExerciseProgramViewModel()
    var body: some View {
        ZStack {
            if appState.showAnimation {
                AnimatedStarView()
            } else {
                InitialView(firstText: "AI Destekli\nAntrenman Planı",
                            secondText: "Size özel antrenman planınızı oluşturmamız için kişisel bilgilerinize ihtiyacımız var.\nLütfen soruları cevaplayın.")
                //b
            }
        }
        .padding(.bottom, 40)
        .toolbar(.hidden)
    }
}

#Preview {
    AISupportedTrainingPlan()
}
