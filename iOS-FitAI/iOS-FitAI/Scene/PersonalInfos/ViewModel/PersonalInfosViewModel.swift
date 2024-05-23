//
//  PersonalInfosViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

class PersonalInfosViewModel : ObservableObject {
    
    @Published var pageStep : PersonalInfosModel.PersonalInfosFlow = .gender
    
    @AppStorage("personalInfos") var personalInfoData = PersonalInfosModel.PersonalInfos()

    
}
