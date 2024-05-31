//
//  WelcomeView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 31.05.2024.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.welcomeViewTitle)
                MFAIText(title: PersonalInfosModel.Constants.welcomeViewContent)
                Spacer()
                MFAITextField(title: "Ad", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                MFAITextField(title: "Soyad", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                MFAITextField(title: "Kullanıcı Adı", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                MFAITextField(title: "E-posta", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                MFAITextField(title: "Parola", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                MFAITextField(title: "Parola Tekrar", textfieldText: $personalInfoVM.personalInfoData.name.toUnwrapped(defaultValue: ""))
                Spacer()
                MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextRegister){
                    personalInfoVM.pageStep = .gender
                }
                
            }
        }
    }
}

#Preview {
    WelcomeView(personalInfoVM: PersonalInfosViewModel())
}
