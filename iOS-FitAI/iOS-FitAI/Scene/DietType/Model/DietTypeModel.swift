//
//  DietTypeModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import Foundation

enum DietTypeModel{
    enum Constants{
        static let dietTypePlansViewTitle = "AI Destekli  Beslenme Planı"
        static let dietTypePlansViewContent = "Size özel beslenme planınıza oluşturmamız için kişisel bilgilerinize ihtiyacımız var. Lütfen soruları cevaplayın."
        static let knownHealthProblemViewTitle = "Bilinen sağlık sorununuz var mı?"
        static let foodAllergyViewTitle = "Hangi yiyeceklere alerjiniz var?"
        static let dietTypeViewTitle = "Hangi tip diyet yapmak istersiniz?"
        static let specialPlanViewTitle = "Size Özel Plan Oluşturuluyor"
        static let specialPlanViewContent = "Kişiselleştirilmiş planlarınız yapay zeka desteğiyle oluşturuluyor."
    }
    enum ButtonTextContext{
        static let buttonTextStart = "Başla"
        static let buttonTextNext = "Sonraki"
        static let buttonTextCreate = "Oluştur"
        static let buttonTextNo = "Yok / Belirtmek İstemiyorum"
    }
    enum DietTypeFlow: String{
        case dietTypePlans
        case knownHealthProblem
        case foodAllergy
        case dietType
        case dietSpecialType
    }
    struct DietTypeInfo: Codable, RawRepresentable{
        init(knownHealthProblem: [String]? = nil,
             foodAllergy: String? = nil,
             dietType: [String]? = nil)
        {
            self.knownHealthProblem = knownHealthProblem
            self.foodAllergy = foodAllergy
            self.dietType = dietType
        }
    
        var knownHealthProblem: [String]?
        var foodAllergy: String?
        var dietType: [String]?
    }
}

extension DietTypeModel.DietTypeInfo {
    
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            print("Hata: String'i verilere dönüştürme başarısız.")
            return nil
        }
        guard let result = try? JSONDecoder().decode(DietTypeModel.DietTypeInfo.self, from: data) else {
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
