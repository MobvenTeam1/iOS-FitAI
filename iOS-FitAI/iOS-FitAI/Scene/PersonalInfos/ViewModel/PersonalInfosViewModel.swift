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
    @Published var kVKKEnabled = false
    
    var cancellables = Set<AnyCancellable>()
    
//    @AppStorage("personalInfos") static var personalInfoDataApp = PersonalInfosModel.PersonalInfos(gender: "", height: "", firstWeight: "", targetWeight: "", dateOfBirth: "", goals: [""])
    
    @Published var personalInfoData = PersonalInfosModel.PersonalInfos(gender: "", height: "", firstWeight: "", targetWeight: "", dateOfBirth: "", goals: [""])

    
    @MainActor
    func postPersonalInfo() async {
        let response = await API.FITAI.personalInfo(param: personalInfoData).fetch(requestModel: PersonalInfosModel.PersonalInfos.self)
        print("Personal Info response: ", response)
        switch response {
        case .success(let model):
            print("Personal Info model: ", model)
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
