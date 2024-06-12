//
//  UserDetailsViewModel.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 11.06.2024.
//

import Foundation

final class UserDetailsViewModel: ObservableObject {
    @Published var userDetails: UserDetails? = nil
    
    @MainActor
    func getUserDetails() async {
        let result = await API.FITAI.userDetails.fetch(requestModel: UserDetails.self)
        switch result {
        case let .success(data):
            userDetails = data
            print("User Details: ", data)
        case let .failure(error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
