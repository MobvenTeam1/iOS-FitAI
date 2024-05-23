//
//  PersonalInfosModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import Foundation


enum PersonalInfosModel {
    enum Constants {
        static let genderViewTitle = "Cinsiyetiniz nedir?"
    }
    
    struct PersonalInfos: Codable, RawRepresentable {
        var gender:String?
        var height: Double?
        var currentWeight:Double?
        var targetWeight:Double?
        var birthDate: String?
        var targets:[String]?
        var plansSelection:[String]?
        var healthsIssue:[String]?
        var selectedSportsActivites:[String]?
        var sportsCount:[String]?
        var targetAreas:[String]?
        var selectAlergies:[String]?
        var dietType: String?
        var dailyActiveStatus:String?
        var dailySleepHours:String?
        var dailyWaterGlass:String?
    }
    
    enum PersonalInfosFlow: String {
        case gender
        case height
        case currentWeight
        case targetWeight
        case birthDate
        case targets
        case plansSelection
        case healthsIssue
        case selectedSportsActivites
        case sportsCount
        case targetAreas
        case selectAlergies
        case dietType
        case dailyActiveStatus
        case dailySleepHours
        case dailyWaterGlass
    }
    
    
}

extension PersonalInfosModel.PersonalInfos {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(PersonalInfosModel.PersonalInfos.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
