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
                HStack{
                    Button {
                        personalInfoVM.pageStep = .gender
                    }
                        label: {
                        Image("back")
                                .resizable()
                                .frame(width: 41, height: 41)
                                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    Button {}
                        label: {
                        Image("Onboarding-5-Icon")
                                .resizable()
                                .frame(width: 41, height: 41)
                                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.heightViewTitle)
                MFAITextField(title: "155 cm",
                              keyboardType: .decimalPad,
                              textfieldText: $personalInfoVM.personalInfoData.height.toUnwrapped(defaultValue: ""))
                .padding(.bottom, 500)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .currentWeight
                }
                .padding(.bottom, 30)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    HeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}

