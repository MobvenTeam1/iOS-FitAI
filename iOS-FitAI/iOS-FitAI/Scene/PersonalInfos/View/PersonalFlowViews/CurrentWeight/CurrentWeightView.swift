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
                HStack{
                    Button {
                        personalInfoVM.pageStep = .height
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
                .padding(20)
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.currentWeightViewTitle)
                MFAITextField(title: "50kg", keyboardType: .decimalPad, textfieldText: $personalInfoVM.personalInfoData.firstWeight.toUnwrapped(defaultValue: ""))
                    .padding(.bottom, 500)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .targetWeight
                }
                .padding(.bottom, 30)
            }
            .navigationBarBackButtonHidden(true)
               .toolbar {
                   ToolbarItem(placement: .topBarLeading) {
                       Button(action: {
                           personalInfoVM.pageStep = .height
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
    CurrentWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
