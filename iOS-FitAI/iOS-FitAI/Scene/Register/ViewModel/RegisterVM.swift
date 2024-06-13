//
//  RegisterVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation
import SwiftUI

struct APIError: Decodable, Error {
    let message: String?
    let details: String?
}

class RegisterVM : ObservableObject {
    @Published var kVKKEnabled = false
    @Published var registerInfoData = RegisterModel.Request(firstName: "", lastName: "", userName: "", email: "", password: "", passwordConfirm: "")
    
    @MainActor
    func getRegisterRequest() async {
        let response = await API.FITAI.register(param: registerInfoData).fetch(requestModel: RegisterModel.Response.self)
        switch response {
        case .success(let model):
            AppStorageManager.shared.userToken = (model.token).toEmpty
            print("Register Token is", AppStorageManager.shared.userToken)
        case .failure(let error):
            if let apiError = error as? APIError, let message = apiError.message {
                           AlertManager.showAlert(title: "Error", message: message)
                       } else {
                           AlertManager.showAlert(title: "Error", message: error.localizedDescription)
                       }
        }
    }
}
