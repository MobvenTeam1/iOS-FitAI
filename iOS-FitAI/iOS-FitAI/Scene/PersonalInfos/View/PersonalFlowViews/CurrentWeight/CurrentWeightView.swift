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
                MFAITextField(title: "50kg", keyboardType: .decimalPad, textfieldText: $personalInfoVM.personalInfoData.currentWeight.toUnwrapped(defaultValue: ""))
                    .padding(.bottom, 400)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    personalInfoVM.pageStep = .targetWeight
                }
                .padding(30)
            }
            .onAppear(perform: {
                progressBarValue = 0.4
                
            })
        }
    }
}

#Preview {
    CurrentWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
