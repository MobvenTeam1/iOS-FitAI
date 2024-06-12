//
//  LoginModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation

public enum LoginModel {
    
    public struct Request: Codable {
        init(
            email: String? = nil,
            password: String? = nil) {
                self.email = email
                self.password = password
            }
        var email: String?
        var password: String?
    }
    public struct Response: Codable {
        let userToken: UserToken?
    }
    
    public struct UserToken: Codable {
        let token: String?
        let isFirstLogin: Bool?
    }
}
