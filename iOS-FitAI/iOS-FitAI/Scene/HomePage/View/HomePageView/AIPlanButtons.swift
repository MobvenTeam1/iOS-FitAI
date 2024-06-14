//
//  AIPlanButtons.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 3.06.2024.
//

import SwiftUI

struct AIPlanButtons: View {
    @EnvironmentObject var appState: AppState
    @Binding var goToTrainingAIPage: Bool
    @Binding var goToNutritionAIPage: Bool
    @StateObject var userDetailsVM = UserDetailsViewModel()
    var body: some View {
        VStack(spacing: -12) {
            if !appState.isTrainingPlanned {
                PersonalizedPlanButton(imageName: "dumbell", text: "Kişiselleştirilmiş Antrenman\nPlanını Oluştur ") {
                    startTrainingPlan()
                }
            } else {
                TrainingPlannedSubView(isTrainingTapped: $appState.isTrainingTapped,
                                       typeOfExercise: userDetailsVM.userDetails?.preferredActivities ?? ""
//                                       typeOfExercise: "Pilates",)
            )}
                                       
            if !appState.isNutritionPlanned {
                PersonalizedPlanButton(imageName: "beslenme", text: "Kişiselleştirilmiş Beslenme\nPlanını Oluştur ") {
                    startNutritionPlan()
                }
            } else {
                NutritionPlanningSubView(isNutritionTapped: $appState.isNutritionTapped,
                                         typeOfMeal: "Kahvaltı"
                                        )
            }
        }
        .task {
            await userDetailsVM.getUserDetails()
        }
    }
    private func startTrainingPlan() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            appState.isTrainingPlanned = true
        }
        goToTrainingAIPage = true
        
    }
    private func startNutritionPlan() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            appState.isNutritionPlanned = true
        }
        goToNutritionAIPage = true
    }
}

#Preview {
    AIPlanButtons(goToTrainingAIPage: .constant(true), goToNutritionAIPage: .constant(true))
        .environmentObject(AppState())
}
