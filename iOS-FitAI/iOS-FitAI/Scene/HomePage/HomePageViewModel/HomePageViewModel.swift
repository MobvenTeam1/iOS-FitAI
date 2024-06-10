//
//  HomePageViewModel.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 10.06.2024.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    @Published var trainingData: [FitnessAntrenman] = []
    
    @MainActor
    func getTraining() async {
        let response = await API.FITAI.training.fetch(requestModel: TrainingModel.self)
        switch response {
        case .success(let data):
                self.trainingData = data.fitnessAntrenman ?? []
                print(data)
                print("Adet: ", self.trainingData.count)
        case .failure(let error):
            print("123", error.localizedDescription, error)
        }
    }
}
