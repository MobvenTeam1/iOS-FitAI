//
//  LoginVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation
final class LoginVM: ObservableObject {
    @Published var loginInfoData = LoginModel.Request(email: "", password: "")
    @Published var isLoginSuccessful: Bool = false
    
    @MainActor
    func getRequest() async {
        let response = await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self)
        switch response {
        case .success(let model):
            AppStorageManager.shared.userToken = (model.token).toEmpty
            print("Login Token is:" , AppStorageManager.shared.userToken)
            isLoginSuccessful = true
        case .failure(let error):
            if let apiError = error as? APIError, let details = apiError.details {
                AlertManager.showAlert(title: "Error", message: details)
            } else {
                AlertManager.showAlert(title: "Error", message: error.localizedDescription)
            }
            isLoginSuccessful = false
        }
    }
}
