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
    @State var progressBarView = ProgressView()
    //a
    @State private var showAnimation: Bool = false
    //b
    var body: some View {
        ZStack{
            VStack{
                ProgressView(value: progressBarValue)
                    .progressViewStyle(CustomProgressViewStyle(trackColor: .gray, progressColor: .buttonGreen))
                    .frame(width: 327, height: 4)
                    .padding(.top)
                if viewmodel.pageStep == .workoutPlans{
                    WorkoutPlansView(exerciseVM: viewmodel)
                }else if viewmodel.pageStep == .healthProblem{
                    HealthProblemView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .sportOption{
                    SportOptionsView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .sportFrequency{
                    SportFrequencyView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .directArea{
                    FocusAreaView(exerciseVM: viewmodel, progressBarValue: $progressBarValue)
                }else {
                    SpecialPlanView(exerciseVM: viewmodel)
                }
            }
        }
    }
}

//#Preview {
//    ExerciseProgramView()
//}
