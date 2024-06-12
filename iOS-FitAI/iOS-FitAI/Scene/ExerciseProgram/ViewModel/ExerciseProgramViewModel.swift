//
//  ExerciseProgramViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

class ExerciseProgramViewModel: ObservableObject {
    
    @Published var pageStep: ExerciseProgramModel.ExerciseProgramFlow = .workoutPlans
    
    @AppStorage("exerciseProgram") static var exerciseProgramDataApp = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", sportOption: [""], sportFrequency: "", directArea: [""])
    
    @Published var exerciseProgramData = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", sportOption: [""], sportFrequency: "", directArea: [""])
    
    func getRegisterRequest() async {
        let response = await API.FITAI.exerciseProgramQuestion(params: exerciseProgramData).fetch(requestModel: ExerciseProgramModel.ExerciseProgramInfo.self)
        switch response {
        case .success(let model):
            print("Success")
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}


