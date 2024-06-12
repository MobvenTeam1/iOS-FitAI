//
//  PersonalInfosViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI
import Foundation
import Combine

class PersonalInfosViewModel : ObservableObject {
    @Published var pageStep : PersonalInfosModel.PersonalInfosFlow = .gender
    @Published var isPersonalInfoFlowFinished = false
    @Published var personalInfoData = PersonalInfosModel.PersonalInfos(gender: "",
                                                                       heldHeight: "",
                                                                       currentWeight: "",
                                                                       goalWeight: "",
                                                                       dateOfBirth: .now,
                                                                       goals: "")
    
    @MainActor
    func getPersonalInfoRequest() async {
        let response = await
        API.FITAI.personalInfo(param: personalInfoData).fetch(requestModel: String.self)
        switch response {
        case .success(let model):
            isPersonalInfoFlowFinished = true
        case .failure(let failure):
            AlertManager.showAlert(title: "Error!", message: failure.localizedDescription)
            
        }
    }
}
