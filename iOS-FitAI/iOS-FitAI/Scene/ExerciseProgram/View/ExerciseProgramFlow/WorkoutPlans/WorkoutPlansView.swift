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
                    .padding(.trailing, 30 )
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewTitle)
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, -56)
                MFAIText(title: ExerciseProgramModel.Constants.workoutPlansViewContent)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextStart,buttonBackgroundColor: .buttonGreen){
                    exerciseVM.pageStep = .healthProblem
                }
                .padding(.bottom, 30)
            
            }
        }
    }
}

#Preview {
    WorkoutPlansView(exerciseVM: ExerciseProgramViewModel())
}

