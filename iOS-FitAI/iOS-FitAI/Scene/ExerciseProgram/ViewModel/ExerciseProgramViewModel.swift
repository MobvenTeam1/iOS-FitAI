//
//  ExerciseProgramViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

class ExerciseProgramViewModel: ObservableObject {
    
    @Published var pageStep: ExerciseProgramModel.ExerciseProgramFlow = .workoutPlans
    
    @AppStorage("exerciseProgram") static var exerciseProgramDataApp = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", preferredActivities: [""], workoutFrequency: "", focusAreas: [""])
    
    @Published var exerciseProgramData = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", preferredActivities: [""], workoutFrequency: "", focusAreas: [""])
    
    @MainActor
    func postWorkoutDetails() async {
        let response = await API.FITAI.exerciseProgram(param: exerciseProgramData).fetch(requestModel: ExerciseProgramModel.ExerciseProgramInfo.self)
        print("Workout Details response: ", response)
        switch response {
        case .success(let model):
            print("Workout Details model: ", model)
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}


