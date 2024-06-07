//
//  RegisterVM.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation
import SwiftUI
import Combine

class RegisterVM : ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var registerInfoData = RegisterModel.Request(firstname: "", surname: "", username: "", ePosta: "", password: "", passwordConfirm: "")
    
    func getRegisterRequest() async{
        let response = await API.FITAI.register(param: registerInfoData).fetch(requestModel: RegisterModel.Response.self)
        
        switch response {
        case .success(let model):
            AppStorageManager.shared.accessToken = model.userToken.toEmpty
        case .failure(let error):
            AlertManager.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}

