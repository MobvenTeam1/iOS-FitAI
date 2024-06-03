//
//  FoodAllergyIView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct FoodAllergyIView: View {
    @ObservedObject var dietVM: DietTypeViewModel
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: DietTypeModel.Constants.foodAllergyViewTitle)
                MFAITextField(title: "Gluten, laktoz...", textfieldText: $dietVM.dietTypeData.foodAllergy.toUnwrapped(defaultValue: ""))
                Spacer()
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.30
                    dietVM.pageStep = .dietType
                }
            }
            .navigationBarBackButtonHidden(true)
               .toolbar {
                   ToolbarItem(placement: .topBarLeading) {
                       Button(action: {
                           dietVM.pageStep = .knownHealthProblem
                       }, label: {
                           Image("back")
                               .resizable()
                               .frame(width: 41, height: 41)
                       })
                   }
               }
               .toolbar {
                         ToolbarItem(placement: .topBarTrailing) {
                                 Image("Onboarding-5-Icon")
                                     .resizable()
                                     .frame(width: 32, height: 36)
                         }
                     }
        }
    }
}

#Preview {
    FoodAllergyIView(dietVM: DietTypeViewModel(), progressBarValue: .constant(0.35))
}
