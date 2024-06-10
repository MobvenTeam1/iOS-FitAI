//
//  Movie.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation

public extension API {
    enum FITAI: Networkable {
        case login(params: LoginModel.Request)
        case register(param: RegisterModel.Request)
        case training
        
        
        public func request() async -> URLRequest {
            switch self {
            case .login(let params):
                await getRequest(data: params, path: "User/Login", httpMethod: .post)
            case .register(let params):
                await getRequest(data: params, path: "User/Register", httpMethod: .post)
            case .training:
                await getRequest(path: "WorkoutPlan/generateworkoutplan", httpMethod: .post)
            }
        }
    }
}
