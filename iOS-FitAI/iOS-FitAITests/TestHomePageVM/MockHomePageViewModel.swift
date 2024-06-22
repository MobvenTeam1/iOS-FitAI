//
//  MockHomePageViewModel.swift
//  iOS-FitAITests
//
//  Created by Ahmet Yasin Atakan on 22.06.2024.
//

@testable
import iOS_FitAI

final class MockHomePageViewModel: HomePageViewModel {
    var mockNetworkService: MockNetworkService?
    
    override func getTraining() async {
        isLoading = true
        let response = await mockNetworkService?.fetch(requestModel: TrainingModel.self)
        switch response {
        case .success(let data):
            if let firstDay = data.fitnessAntrenman?.first(where: { $0.day == "day_one" }) {
                self.trainingProgram = firstDay.program
            }
            print("DEBUG: \(String(describing: self.trainingProgram))" )
        case .failure(let error):
            print("Error: ", error.localizedDescription, error)
        case .none:
            break
        }
        isLoading = false
    }
}
