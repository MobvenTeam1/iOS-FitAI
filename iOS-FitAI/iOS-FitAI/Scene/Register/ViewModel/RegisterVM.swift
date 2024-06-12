//
//  RegisterVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation
import SwiftUI

class RegisterVM : ObservableObject {
    @Published var kVKKEnabled = false
    @Published var registerInfoData = RegisterModel.Request(firstName: "", lastName: "", userName: "", email: "", password: "", passwordConfirm: "")
    
    @MainActor
    func getRegisterRequest() async {
        let response = await API.FITAI.register(param: registerInfoData).fetch(requestModel: RegisterModel.Response.self)
        switch response {
        case .success(let model):
            AppStorageManager.shared.userToken = (model.userToken?.token).toEmpty
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
