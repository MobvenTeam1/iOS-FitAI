//
//  TargetWeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.


import SwiftUI

struct TargetWeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetWeightViewTitle)
                Spacer(minLength: 50)
                MFAITextField(title: "String", textfieldText: $personalInfoVM.personalInfoData.targetWeight.toUnwrapped(defaultValue: ""))
                Spacer()
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .birthDate
                }
            }
        }
    }
}

#Preview {
    TargetWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
