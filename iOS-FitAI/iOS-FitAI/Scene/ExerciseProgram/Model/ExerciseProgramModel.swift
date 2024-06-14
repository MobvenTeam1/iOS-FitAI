//
//  ExerciseProgramModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import Foundation

public enum ExerciseProgramModel {
    
    enum Constants{
        static let workoutPlansViewTitle = "AI Destekli  Antreman Planı"
        static let workoutPlansViewContent = "Size özel beslenme planınıza oluşturmamız için kişisel bilgilerinize ihtiyacımız var. Lütfen soruları cevaplayın."
        static let healthProblemViewTitle = "Bilinen sağlık sorununuz var mı?"
        static let sportOptionsViewTitle = "Tercih ettiğiniz spor aktiviteleri nelerdir?"
        static let sportFrequencyViewTitle = "Hangi sıklıkla spor yapmak istersiniz?"
        static let focusAreaViewtitle = "Odaklanmak İstediğiniz bölgeler nereler?"
        static let specialPlansViewTitle = "Size Özel Plan Oluşturuluyor"
        static let specialPlansViewContent = "Kişiselleştirilmiş planlarınız yapay zeka desteğiyle oluşturuluyor."
    }
    
    enum ButtonTextContext {
        static let buttonTextStart = "Başla"
        static let buttonTextNext = "Sonraki"
        static let buttonTextCreate = "Oluştur"
        static let buttonTextNo = "Yok / Belirtmek İstemiyorum"
    }
    
    enum ExerciseProgramFlow: String {
        case workoutPlans
        case healthProblem
        case sportOption
        case sportFrequency
        case directArea
        case specialPlan
    }
    
    public struct ExerciseProgramInfo: Codable {
        var preferredActivities: String?
        var workoutFrequency: String?
        var focusAreas: String?
        var healthProblem: String?
        
        init(
            preferredActivities: String? = nil,
            workoutFrequency: String? = nil,
            focusAreas: String? = nil,
            healthProblem: String? = nil)
        {
            self.preferredActivities = preferredActivities
            self.workoutFrequency = workoutFrequency
            self.focusAreas = focusAreas
            self.healthProblem = healthProblem
        }
    }
}
