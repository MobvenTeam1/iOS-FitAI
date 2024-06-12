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
    public struct ExerciseProgramInfo: Codable, RawRepresentable {
        init(healthProblem: String? = nil,
             sportOption: [String]? = nil,
             sportFrequency: String? = nil,
             directArea: [String]? = nil)
        {
            self.healthProblem = healthProblem
            self.sportOption = sportOption
            self.sportFrequency = sportFrequency
            self.directArea = directArea
        }
        
        var healthProblem: String?
        var sportOption: [String]?
        lazy var preferredActivities: String? = {
            return sportOption?.joined(separator:"-")
        }()
        var sportFrequency: String?
        var directArea: [String]?
        lazy var focusArea: String? = {
           return  directArea?.joined(separator: "-")
        }()
        
    }
}

extension ExerciseProgramModel.ExerciseProgramInfo{
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            print("Hata: String'i verilere dönüştürme başarısız.")
            return nil
        }
        guard let result = try? JSONDecoder().decode(ExerciseProgramModel.ExerciseProgramInfo.self, from: data) else {
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

