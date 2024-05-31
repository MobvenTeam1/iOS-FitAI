//
//  WeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.
//

import SwiftUI

struct CurrentWeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double

    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.currentWeightViewTitle)
                Spacer(minLength: 50)
                MFAITextField(title: "String", textfieldText: $personalInfoVM.personalInfoData.currentWeight.toUnwrapped(defaultValue: ""))
                Spacer()
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .targetWeight
                }
            }
        }
    }
}

#Preview {
    CurrentWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
