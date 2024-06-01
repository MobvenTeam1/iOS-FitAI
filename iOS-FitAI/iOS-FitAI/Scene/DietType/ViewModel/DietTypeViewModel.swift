//
//  DietTypeViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//
import SwiftUI
import Foundation

class DietTypeViewModel: ObservableObject{
    
    @Published var pageStep: DietTypeModel.DietTypeFlow = .dietTypePlans
    
    @AppStorage("dietType") static var dietTypeDataApp = DietTypeModel.DietTypeInfo(knownHealthProblem: [""] ,foodAllergy:[""],dietType: "" )
    
    @Published var dietTypeData = DietTypeModel.DietTypeInfo(knownHealthProblem: [""], foodAllergy: [""], dietType: "")
}
