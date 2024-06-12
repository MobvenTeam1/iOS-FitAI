//
//  LoginVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation

//final class LoginVM: ObservableObject {
//    @Published var loginInfoData = LoginModel.Request(email: "", password: "")
//    
//    @MainActor
//    func getRequest() async {
//        let response = await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self)
//        switch response {
//        case .success(let model):
//            if AppStorageManager.shared.userToken == model.userToken?.token {
//                print("Login successful with token: ", AppStorageManager.shared.userToken)
//                // Navigate to the home screen or other appropriate action
//            } else {
//                AlertManager.showAlert(title: "Error", message: "Invalid credentials")
//            }
//        case .failure(let error):
//            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
//        }
//    }
//}

final class LoginVM: ObservableObject {
    @Published var loginInfoData = LoginModel.Request(email: "", password: "")
    @Published var isLoginSuccessful: Bool = false
    @MainActor
    func getRequest() async {
        guard let registrationToken = AppStorageManager.shared.registrationToken else {
            print("No registration token found.")
            return
        }

        let response = await API.FITAI.login(params: loginInfoData).fetch(requestModel: LoginModel.Response.self)
        switch response {
        case .success(let model):
            if let loginToken = model.userToken?.token {
                AppStorageManager.shared.userToken = loginToken
                print("Login Token is: ", AppStorageManager.shared.userToken ?? "")
                isLoginSuccessful = true
            }
        case .failure(let error):
            AlertManager.showAlert(title: "Hatalı Giriş", message: "E-posta veya şifre yanlış. Lütfen tekrar deneyin.")
            print("Error: ", error.localizedDescription)
            isLoginSuccessful = false
        }
    }
}
