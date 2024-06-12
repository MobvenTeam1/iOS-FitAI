//
//  ExerciseProgramViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI
import Foundation

class ExerciseProgramViewModel: ObservableObject {
    
    @Published var pageStep: ExerciseProgramModel.ExerciseProgramFlow = .workoutPlans
    
    @AppStorage("exerciseProgram") static var exerciseProgramDataApp = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", sportOption: [""], sportFrequency: "", focusArea: [""])
    
    @Published var exerciseProgramData = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", sportOption: [""], sportFrequency: "", focusArea: [""])
}


