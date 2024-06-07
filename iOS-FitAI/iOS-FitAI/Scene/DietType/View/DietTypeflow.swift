//
//  DietTypeflow.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct DietTypeflow: View {
    @StateObject var viewmodel = DietTypeViewModel()
    @State var progressBarValue: Double = 0.0
    var body: some View {
        ZStack{
            VStack{
                ProgressView(value: progressBarValue)
                    .progressViewStyle(CustomProgressViewStyle(trackColor: .gray, progressColor: .buttonGreen))
                    .padding()
                
                if viewmodel.pageStep == .dietTypePlans{
                    DietTypePlansIView(dietVM: viewmodel)
                }else if viewmodel.pageStep == .knownHealthProblem{
                    KnownHealthProblemView(dietVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .foodAllergy{
                    FoodAllergyIView(dietVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .dietType{
                    DietTypeView(dietVM: viewmodel, progressBarValue: $progressBarValue)
                }else{
                    DietSpecialTypeView(dietVM: viewmodel)
                }
            }
        }
    }
}

#Preview {
    DietTypeflow()
}
