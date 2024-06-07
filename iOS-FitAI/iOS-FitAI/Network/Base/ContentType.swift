//
//  ContentType.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation
enum ContentType {
    case json
    case multipartFromData

    var rawValue: String{
        switch self {
        case .json:
            "application/json"
        case .multipartFromData:
            ""
        }
    }
}
