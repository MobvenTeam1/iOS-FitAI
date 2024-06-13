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
        case personalInfo(param: PersonalInfosModel.PersonalInfos)
        case training
        case userDetails
        case exerciseProgramQuestion(params: ExerciseProgramModel.ExerciseProgramInfo)
        
        public func request() async -> URLRequest {
            switch self {
            case .login(let params):
                await getRequest(data: params, path: "User/login", httpMethod: .post)
            case .register(let params):
                await getRequest(data: params, path: "User/register", httpMethod: .post)
            case .personalInfo(let params):
                await getRequest(data: params, path: "User/savefirstlogindetails", httpMethod: .post)
            case .training:
                await getRequest(path: "WorkoutPlan/generateworkoutplan", httpMethod: .get)
            case .userDetails:
                await getRequest(path: "User/GetUserDetails", httpMethod: .get)
            case .exerciseProgramQuestion(params: let params):
                await getRequest(data: params, path: "WorkoutPlan/workoutdetails", httpMethod: .post)
            }
        }
    }
}

