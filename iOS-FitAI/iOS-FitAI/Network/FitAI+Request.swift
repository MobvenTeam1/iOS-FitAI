//
//  Movie.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation

public extension API {
    enum FITAI: Networkable {
        case login(body: String)
        case register(param: RegisterModel.Request)
        case deneme(deneme: String)
        
        
        public func request() async -> URLRequest {
            switch self {
            case .login(let body):
                await getRequest(data: body, path: "User/Login",httpMethod: .post)
            case .register(let params):
                await getRequest(data: params, path: "User/Register", httpMethod: .post)
            case .deneme(let dnm):
                await getRequest(data: dnm, path: "/eneme", httpMethod: .post)
            }
        }
    }
}
