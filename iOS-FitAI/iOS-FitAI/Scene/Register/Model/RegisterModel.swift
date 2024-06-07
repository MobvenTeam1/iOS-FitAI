//
//  RegisterModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation

public enum RegisterModel{
    
    enum Constants{
        static let buttonTextRegister = "Kayıt Ol"
        static let welcomeViewTitle = "Hoşgeldin!"
        static let welcomeViewContent = "Sağlıklı yaşama adım atmak için kayıt olun"

    }
    
    public struct Request: Codable{
        init(
            firstname: String? = nil,
            surname: String? = nil,
            username: String? = nil,
            ePosta: String? = nil,
            password: String? = nil,
            passwordConfirm: String? = nil)
            {
                self.firstname = firstname
                self.lastName = surname
                self.username = username
                self.email = ePosta
                self.password = password
                self.passwordConfirm = passwordConfirm
            }

        var firstname: String?
        var lastName: String?
        var username: String?
        var email: String?
        var password: String?
        var passwordConfirm:String?
    }
    
    public struct Response: Codable {
        let userToken: String?
    }
}

