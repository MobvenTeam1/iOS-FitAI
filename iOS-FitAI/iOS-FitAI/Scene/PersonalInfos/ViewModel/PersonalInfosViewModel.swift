//
//  PersonalInfosViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

class PersonalInfosViewModel : ObservableObject {
    @Published var pageStep : PersonalInfosModel.PersonalInfosFlow = .gender
    @Published var isPersonalInfoFlowFinished = false
    @Published var personalInfoData = PersonalInfosModel.PersonalInfos(gender: "", heldHeight: nil, currentWeight: nil, goalWeight: nil, dateOfBirth: "2000-10-10", goals: "")

    @MainActor
    func getPersonalInfoRequest() async {
        let response = await
        API.FITAI.personalInfo(param: personalInfoData).fetch(requestModel: Bool.self)
        switch response {
        case .success(let model):
            isPersonalInfoFlowFinished = true
            print("personal info: ", model)
            print(personalInfoData)
        case .failure(let failure):
            AlertManager.showAlert(title: "Error!", message: failure.localizedDescription)
        }
    }
}
