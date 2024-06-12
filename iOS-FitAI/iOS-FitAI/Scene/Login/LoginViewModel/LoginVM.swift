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
            AppStorageManager.shared.userToken = (model.userToken?.token).toEmpty
        case .failure(let error):
            AlertManager.showAlert(title: "Hatalı Giriş", message: "E-posta veya şifre yanlış. Lütfen tekrar deneyin.")
            print("Error: ", error.localizedDescription)
            isLoginSuccessful = false
        }
    }
    
}
