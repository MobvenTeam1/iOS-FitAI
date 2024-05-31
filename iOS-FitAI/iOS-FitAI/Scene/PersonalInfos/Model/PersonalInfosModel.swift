//
//  PersonalInfosModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import Foundation


enum PersonalInfosModel {
    enum Constants {
        static let welcomeViewTitle = "Hoşgeldin!"
        static let welcomeViewContent = "Sağlıklı yaşama adım atmak için kayıt olun"
        static let genderViewTitle = "Cinsiyetiniz nedir?"
        static let heightViewTitle = "Boyunuz kaç?"
        static let currentWeightViewTitle = "Mevcut kilonuz kaç?"
        static let targetWeightViewTitle = "Hedef kilonuz kaç?"
        static let birthdayViewTitle = "Doğum gününüz nedir?"
        static let targetsViewTitle = "Hedefleriniz nelerdir?"
        
    }
    enum ButtonTextContext{
        static let buttonTextNext = "Sonraki"
        static let buttonTextOK = "Tamamlandı"
        
    }
    
    struct PersonalInfos: Codable, RawRepresentable{
        init(
            name: String? = nil,
            surname: String? = nil,
            username: String? = nil,
            ePosta: String? = nil,
            password: String? = nil,
            passwordConfirm: String? = nil,
            gender: String? = nil,
            height: String? = nil,
            currentWeight: String? = nil,
            targetWeight: String? = nil,
            birthDate: String? = nil,
            targets: [String]? = nil,
            plansSelection: [String]? = nil,
            healthsIssue: [String]? = nil,
            selectedSportsActivites: [String]? = nil,
            sportsCount: [String]? = nil,
            targetAreas: [String]? = nil,
            selectAlergies: [String]? = nil,
            dietType: String? = nil,
            dailyActiveStatus: String? = nil,
            dailySleepHours: String? = nil,
            dailyWaterGlass: String? = nil)
        {
            self.name = name
            self.surname = surname
            self.username = username
            self.ePosta = ePosta
            self.password = password
            self.passwordConfirm = passwordConfirm
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
        var name: String?
        var surname: String?
        var username: String?
        var ePosta: String?
        var password: String?
        var passwordConfirm:String?
        var gender: String?
        var height: String?
        var currentWeight: String?
        var targetWeight: String?
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
        case name
        case surname
        case username
        case ePosta
        case password
        case passwordConfirm
        case welcome
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
