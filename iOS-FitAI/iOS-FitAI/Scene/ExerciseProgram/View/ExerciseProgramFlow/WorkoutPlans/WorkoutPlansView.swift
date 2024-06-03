//
//  WorkoutPlansView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct WorkoutPlansView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("specialEllipse")
                    .resizable()
                    .frame(width: 176, height: 176)
                    .padding()
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewTitle)
                    .bold()
                    .font(.title2)
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewContent)
                    .padding()
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextStart,buttonBackgroundColor: .buttonGreen){
                    exerciseVM.pageStep = .healthProblem
                }
            
            }
        }
    }
}

#Preview {
    WorkoutPlansView(exerciseVM: ExerciseProgramViewModel())
}

