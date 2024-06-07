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
    @Published var pageStep : PersonalInfosModel.PersonalInfosFlow = .welcome
    @Published var kVKKEnabled = false
    
    var cancellables = Set<AnyCancellable>()
    
    @AppStorage("personalInfos") static var personalInfoDataApp = PersonalInfosModel.PersonalInfos(gender: "",height: "", currentWeight: "", targetWeight: "", birthDate: "", targets: [""])
    
    @Published var personalInfoData = PersonalInfosModel.PersonalInfos(gender: "",height: "", currentWeight: "", targetWeight: "", birthDate: "", targets: [""])

    
}
