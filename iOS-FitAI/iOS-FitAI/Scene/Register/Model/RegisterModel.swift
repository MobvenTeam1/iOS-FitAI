//
//  RegisterModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation

public enum RegisterModel {
    
    enum Constants{
        static let buttonTextRegister = "Kayıt Ol"
        static let welcomeViewTitle = "Hoşgeldin!"
        static let welcomeViewContent = "Sağlıklı yaşama adım atmak için kayıt olun"
    }
    
    public struct Request: Codable {
        init(
            firstName: String? = nil,
            lastName: String? = nil,
            userName: String? = nil,
            email: String? = nil,
            password: String? = nil,
            passwordConfirm: String? = nil)
            {
                self.firstName = firstName
                self.lastName = lastName
                self.userName = userName
                self.email = email
                self.password = password
                self.passwordConfirm = passwordConfirm
            }

        var firstName: String?
        var lastName: String?
        var userName: String?
        var email: String?
        var password: String?
        var passwordConfirm:String?
    }
    
    public struct Response: Codable {
        let userToken: UserToken?
    }
    
    public struct UserToken: Codable {
        let token: String?
        let isFirstLogin: Bool?
    }
}
