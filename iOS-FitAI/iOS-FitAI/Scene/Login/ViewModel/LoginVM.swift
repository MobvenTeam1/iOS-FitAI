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
        await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self) { (response:Result<LoginModel.Response, any Error>) in
            switch response {
            case .success(let model):
                AppStorageManager.shared.userToken = model.userToken.toEmpty
            case .failure(let error):
                AlertManager.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
