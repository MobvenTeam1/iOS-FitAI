//
//  OnboardingModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 30.05.2024.
//

import Foundation

enum OnboardingModel {
    enum Constants {
        static let personalTargetView = "Bireysel Hedeflerinizi Belirleyin"
        static let personalDietTypeView = "Kişiselleştirilmiş Beslenme Programı"
        static let personalExerciseView = "Kişiselleştirilmiş Antrenmanlar "
        static let dailyCalorieView = "Günlük Kalori Takibi "
        
    }
    enum ContentConstants {
        static let personalTargetViewContent = "Sağlık hedeflerinizi paylaşın, hedefleriniz için size özel bir yol haritası oluşturalım."
        static let personalDietTypeViewContent = "Sağlık durumunuza ve tercihlerinize göre AI destekli beslenme planlarıyla tanışın."
        static let personalExerciseViewContent = "Aktivite seviyenize uygun, motive edici ve etkili antrenman programlarıyla formda kalın."
        static let dailyCalorieViewContent = "Günlük yediklerinizi kaydedin, kalori takibi ile sağlıklı alışkanlıklar edinin."
        
    }
    enum ButtonContent{
        static let buttonTextSkip = "Atla"
        static let buttonTextRegister = "Kayıt Ol"
        static let buttonTextLogin = "Giriş Yap"
    }
    
    enum OnboardingFlow: String{
        case personalTarget
        case personalDietType
        case personalExercise
        case dailyCalorie
        case onboarding5
    }
    
}
