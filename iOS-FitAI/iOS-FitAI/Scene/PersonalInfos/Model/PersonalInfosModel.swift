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
        static let heightViewTitle = "Boyunuz kaç?"
        static let weightViewTitle = "Mevcut kilonuz kaç?"
    }
    
    struct PersonalInfos: Codable, RawRepresentable {
        init(gender: String? = nil, height: String? = nil, currentWeight: Double? = nil, targetWeight: Double? = nil, birthDate: String? = nil, targets: [String]? = nil, plansSelection: [String]? = nil, healthsIssue: [String]? = nil, selectedSportsActivites: [String]? = nil, sportsCount: [String]? = nil, targetAreas: [String]? = nil, selectAlergies: [String]? = nil, dietType: String? = nil, dailyActiveStatus: String? = nil, dailySleepHours: String? = nil, dailyWaterGlass: String? = nil) {
            self.gender = gender
            self.height = height
            self.currentWeight = currentWeight
            self.targetWeight = targetWeight
            self.birthDate = birthDate
            self.targets = targets
            self.plansSelection = plansSelection
            self.healthsIssue = healthsIssue
            self.selectedSportsActivites = selectedSportsActivites
            self.sportsCount = sportsCount
            self.targetAreas = targetAreas
            self.selectAlergies = selectAlergies
            self.dietType = dietType
            self.dailyActiveStatus = dailyActiveStatus
            self.dailySleepHours = dailySleepHours
            self.dailyWaterGlass = dailyWaterGlass
        }
        
        var gender:String?
        var height: String?
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
        guard let data = rawValue.data(using: .utf8) else {
            print("Hata: String'i verilere dönüştürme başarısız.")
            return nil
        }
        guard let result = try? JSONDecoder().decode(PersonalInfosModel.PersonalInfos.self, from: data) else {
            print("Hata: Verileri PersonalInfos'a decode etme başarısız.")
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        do {
            
            let data = try JSONEncoder().encode(self)
            guard let result = String(data: data, encoding: .utf8) else {
                print("Hata: Verileri string'e dönüştürme başarısız.")
                return "[]"
            }
            return result
        } catch {
            print("Hata: \(error)")
            return "[]"
        }
    }
}
