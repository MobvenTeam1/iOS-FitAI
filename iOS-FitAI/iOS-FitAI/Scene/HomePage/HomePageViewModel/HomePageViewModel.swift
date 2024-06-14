//
//  HomePageViewModel.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 10.06.2024.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    @Published var trainingProgram: [String: String]?
    @Published var isLoading: Bool = false
    
    @MainActor
    func getTraining() async {
        isLoading = true
        let response = await API.FITAI.training.fetch(requestModel: TrainingModel.self)
        switch response {
        case .success(let data):
            if let firstDay = data.fitnessAntrenman?.first(where: { $0.day == "day_one" }) {
                self.trainingProgram = firstDay.program
            }
            print("DEBUG: \(String(describing: self.trainingProgram))" )
        case .failure(let error):
            print("Error: ", error.localizedDescription, error)
        }
        isLoading = false
    }
}
