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
                MFAITextField(title: "46kg", keyboardType: .decimalPad, textfieldText: $personalInfoVM.personalInfoData.goalWeight.toUnwrapped(defaultValue: ""))
                .padding(.bottom, 400)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    personalInfoVM.pageStep = .birthDate
                }
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .onAppear(perform: {
                progressBarValue = 0.6
                
            })
        }
    }
}

#Preview {
    TargetWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
