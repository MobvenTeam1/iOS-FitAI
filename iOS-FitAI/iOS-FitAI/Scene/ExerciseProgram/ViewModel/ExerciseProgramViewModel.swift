//
//  ExerciseProgramViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

final class ExerciseProgramViewModel: ObservableObject {
    
//    @Published var pageStep: ExerciseProgramModel.ExerciseProgramFlow = .workoutPlans
    
    @Published var pageStep: ExerciseProgramModel.ExerciseProgramFlow = .healthProblem
    
//    @AppStorage("exerciseProgram") static var exerciseProgramDataApp = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "", sportOption: [""], sportFrequency: "", directArea: [""])
//    
//    @Published var exerciseProgramData = ExerciseProgramModel.ExerciseProgramInfo(healthProblem: "Hayır", sportOption: [""], sportFrequency: "Haftada 3-4", directArea: ["Ketojenik"])

    @Published var exerciseProgramData = ExerciseProgramModel.ExerciseProgramInfo(preferredActivities: "", workoutFrequency: "", focusAreas: "", healthProblem: "")
//
    @MainActor
    func getExercise() async {
        let response = await
        API.FITAI.exerciseProgramQuestion(params: exerciseProgramData).fetch(requestModel: Bool.self)
        switch response {
        case .success(let data):
            print("Exercise program sent")
        case .failure(let failure):
            AlertManager.showAlert(title: "Error!", message: failure.localizedDescription)
        }
    }
}


