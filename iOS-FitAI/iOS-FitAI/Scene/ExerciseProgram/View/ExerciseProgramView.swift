//
//  ExerciseProgramView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct ExerciseProgramView: View {
    @StateObject var viewmodel = ExerciseProgramViewModel()
    @State var progressBarValue: Double = 0.0
    var body: some View {
        ZStack{
            VStack{
                ProgressView(value: progressBarValue)
                    .progressViewStyle(CustomProgressViewStyle(trackColor: .gray, progressColor: .buttonGreen))
                    .padding()
                
                if viewmodel.pageStep == .workoutPlans{
                    WorkoutPlansView(exerciseVM: viewmodel)
                }else if viewmodel.pageStep == .healthProblem{
                    HealthProblemView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .preferredActivities{
                    SportOptionsView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .workoutFrequency{
                    SportFrequencyView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .focusAreas{
                    FocusAreaView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else {
                    SpecialPlanView(exerciseVM: viewmodel)
                }
            }
        }
    }
}

#Preview {
    ExerciseProgramView()
}
