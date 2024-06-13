//
//  HeightWeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.


import SwiftUI

struct HeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.heightViewTitle)
                MFAITextField(title: "155 cm",
                              keyboardType: .decimalPad,
                              textfieldText: $personalInfoVM.personalInfoData.heldHeight.toUnwrapped(defaultValue: ""))
                .padding(.bottom, 450)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    personalInfoVM.pageStep = .currentWeight
                }
                .padding(30)

            }
            .onAppear(perform: {
                progressBarValue = 0.2
                
            })
        }
    }
}
#Preview {
    HeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}

