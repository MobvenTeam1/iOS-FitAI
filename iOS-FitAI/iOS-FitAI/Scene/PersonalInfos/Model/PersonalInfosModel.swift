//
//  PersonalInfosModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import Foundation
import SwiftUI


public enum PersonalInfosModel {
    enum Constants {
        static let genderViewTitle = "Cinsiyetiniz nedir?"
        static let heightViewTitle = "Boyunuz kaç?"
        static let currentWeightViewTitle = "Mevcut kilonuz kaç?"
        static let targetWeightViewTitle = "Hedef kilonuz kaç?"
        static let birthdayViewTitle = "Doğum gününüz nedir?"
        static let targetsViewTitle = "Hedefleriniz nelerdir?"
        static let conditionAndPrivacy = "Şartları ve gizlilik politikasını kabul ediyorum."
        
    }
    enum ButtonTextContext {
        static let buttonTextNext = "Sonraki"
        static let buttonTextOK = "Tamamlandı"
        static let haveAnAccount = "Zaten hesabınız var mı? Giriş Yap"
    }
    
    public struct PersonalInfos: Codable, RawRepresentable{
        init(
            gender: String? = nil,
            heldHeight: String? = nil,
            currentWeight: String? = nil,
            goalWeight: String? = nil,
            dateOfBirth: Date? = nil,
            goals: String? = nil)
        {
            
            self.gender = gender
            self.heldHeight = heldHeight
            self.currentWeight = currentWeight
            self.goalWeight = goalWeight
            self.dateOfBirth = dateOfBirth
            self.goals = goals
            
        }
        
        var gender: String?
        var heldHeight: String?
        lazy var height: Int? = {
            return Int(self.heldHeight ?? "0")
        }()
        var currentWeight: String?
        lazy var firstWeight: Int? = {
            return Int(self.currentWeight ?? "0")
        }()
        var goalWeight: String?
        lazy var targetWeight: Int? = {
            return Int(self.goalWeight ?? "0")
        }()
        var dateOfBirth: Date?
        var goals: String?
        
    }
    
    enum PersonalInfosFlow: Int {
        case welcome
        case gender
        case height
        case currentWeight
        case targetWeight
        case birthDate
        case targets
    }
    
    
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var trackColor: Color
    var progressColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 4)
                .foregroundColor(trackColor)
                .cornerRadius(4)
            
            Rectangle()
                .frame(width: (configuration.fractionCompleted ?? 0) * UIScreen.main.bounds.width, height: 8)
                .foregroundColor(progressColor)
                .cornerRadius(4)
        }
        .frame(height: 8)
    }
}
