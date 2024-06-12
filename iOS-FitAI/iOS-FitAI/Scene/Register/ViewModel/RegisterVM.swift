//
//  RegisterVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation
import SwiftUI

class RegisterVM : ObservableObject {
    @Published var registerInfoData = RegisterModel.Request(firstName: "", lastName: "", userName: "", email: "", password: "", passwordConfirm: "")
    
    @MainActor
    func getRegisterRequest() async {
        let response = await API.FITAI.register(param: registerInfoData).fetch(requestModel: RegisterModel.Response.self)
        switch response {
        case .success(let model):
            if let token = model.userToken?.token {
                AppStorageManager.shared.userToken = token
                print("Register Token is: ", token)
            }
        case .failure(let error):
            AlertManager.showAlert(title: "Hatalı Giriş", message: "Bu e-posta ile daha önce üyelik oluşturuldu.")
//                AlertManager.showAlert(title: "Hata", message: error.localizedDescription)
            }
    }
}
