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
    
   public struct PersonalInfos: Codable {
        init(
            gender: String? = nil,
            height: String? = nil,
            firstWeight: String? = nil,
            targetWeight: String? = nil,
            dateOfBirth: String? = nil,
            goals: [String]? = nil)
        {
            
            self.gender = gender
            self.height = height
            self.firstWeight = firstWeight
            self.targetWeight = targetWeight
            self.dateOfBirth = dateOfBirth
            self.goals = goals
        
        }
        
        var gender: String?
        var height: String?
        var firstWeight: String?
        var targetWeight: String?
        var dateOfBirth: String?
        var goals: [String]?
        
    }
    
    enum PersonalInfosFlow: String {
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
