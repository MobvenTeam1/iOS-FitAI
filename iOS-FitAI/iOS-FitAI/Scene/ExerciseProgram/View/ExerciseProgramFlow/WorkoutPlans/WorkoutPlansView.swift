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
                Image(systemName: "circlebadge.fill")
                    .resizable()
                    .frame(width: 176, height: 176)
                
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewTitle)
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewContent)
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextStart){
                    exerciseVM.pageStep = .healthProblem
                }
            
            }
        }
    }
}

#Preview {
    WorkoutPlansView(exerciseVM: ExerciseProgramViewModel())
}

