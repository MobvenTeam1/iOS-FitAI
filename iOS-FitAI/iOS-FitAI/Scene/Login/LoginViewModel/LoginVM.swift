//
//  LoginVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation

final class LoginVM: ObservableObject {
    @Published var loginInfoData = LoginModel.Request(email: "", password: "")
    
    @MainActor
    func getRequest() async {
        let response = await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self)
        switch response {
        case .success(let model):
                AppStorageManager.shared.userToken = model.userToken.toEmpty
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
