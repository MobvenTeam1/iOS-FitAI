//
//  HealthProblemView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct HealthProblemView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.healthProblemViewTitle)
                MFAITextField(title: "Hamilelik,hamilelik sonrası, minüsküs yırtığı..", textfieldText: $exerciseVM.exerciseProgramData.healthProblem.toUnwrapped(defaultValue: "") )
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNo){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .sportOption
                }
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .sportOption
                }
            }
        }
    }
}

#Preview {
    HealthProblemView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
