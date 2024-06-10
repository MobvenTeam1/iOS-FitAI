//
//  RequestType.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 10.06.2024.
//

import Foundation

enum URLConstants  : String {
    case baseURL = "https://165.22.93.225:5001/api"
    case registerPath = "User/Register"
}

enum RequestType {
    case register

 
    var endPoint : URL? {
        let baseURL =  Bundle.main.infoForKey("BASE_URL") ?? URLConstants.baseURL.rawValue

        
        switch self {
        case .register:
            let url =  baseURL + URLConstants.registerPath.rawValue
            return URL(string: url)
        }
    }
    
    var httpMethod : HttpMethod {
        switch self {
        default:
            return .POST
        }
    }
}

enum HttpMethod : String {
    case GET
    case POST
}
