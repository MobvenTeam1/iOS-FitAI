//
//  LoginVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation

class LoginVM{
    
    @Published var loginInfoData = LoginModel.Request(email: "", password: "")
    
    func getRequest() async{
        let response = await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self)
        switch response {
        case .success(let model):
            AppStorageManager.shared.accessToken = model.userToken.toEmpty
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
