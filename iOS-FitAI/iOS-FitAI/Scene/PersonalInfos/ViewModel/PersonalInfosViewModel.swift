//
//  PersonalInfosViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI
import Foundation

class PersonalInfosViewModel : ObservableObject {
    
    @Published var pageStep : PersonalInfosModel.PersonalInfosFlow = .gender
    
    @AppStorage("personalInfos") static var personalInfoDataApp = PersonalInfosModel.PersonalInfos(targetWeight: "")
    @Published var personalInfoData = PersonalInfosModel.PersonalInfos(targetWeight: "")

    
}
