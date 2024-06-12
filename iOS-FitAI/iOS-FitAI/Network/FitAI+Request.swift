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
        case register(params: RegisterModel.Request)
        case training
        case personalInfo(params: PersonalInfosModel.PersonalInfos)
//        case exerciseProgramQuestion(params: ExerciseProgramModel.ExerciseProgramInfo)
        
        
        public func request() async -> URLRequest {
            switch self {
            case .login(let params):
                await getRequest(data: params, path: "User/Login", httpMethod: .post)
            case .register(let params):
                await getRequest(data: params, path: "User/Register", httpMethod: .post)
            case .training:
                await getRequest(path: "WorkoutPlan/generateworkoutplan", httpMethod: .get)
            case .personalInfo(let params):
                await getRequest(data: params, path: "User/SaveFirstLoginDetails", httpMethod: .post)
//            case .exerciseProgramQuestion(params: let params):
                
            }
        }
    }
}
