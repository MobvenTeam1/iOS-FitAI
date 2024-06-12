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
    @State private var isFocused: Bool = false
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.healthProblemViewTitle)
                MFAITextField(title: "Hamilelik,hamilelik sonrası, minüsküs yırtığı..", textfieldText: $exerciseVM.exerciseProgramData.healthProblem.toUnwrapped(defaultValue: ""))
                if isFocused == true{
                    overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isFocused ? Color.black : Color.clear, lineWidth: 2)
                            .frame(width: 327, height: 72)
                    )
                }
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNo, buttonBackgroundColor: .white)
                {
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .sportOption
                }
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .sportOption
                }
                .padding(50)
            }
        }
    }
}

#Preview {
    HealthProblemView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
