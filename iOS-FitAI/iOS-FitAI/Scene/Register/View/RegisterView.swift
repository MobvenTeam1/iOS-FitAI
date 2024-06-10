//
//  RegisterView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @StateObject var registerVM: RegisterVM = RegisterVM()
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    MFAIPersonalInfosHeaderView(title: RegisterModel.Constants.welcomeViewTitle)
                    MFAIText(title: RegisterModel.Constants.welcomeViewContent)
                    Spacer()
                    MFAITextField(title: "Ad", textfieldText: $registerVM.registerInfoData.firstName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    
                    MFAITextField(title: "Soyad", textfieldText: $registerVM.registerInfoData.lastName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Kullanıcı Adı", textfieldText: $registerVM.registerInfoData.userName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    
                    MFAITextField(title: "E-posta",keyboardType: .emailAddress, textfieldText: $registerVM.registerInfoData.email.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Parola", textfieldText: $registerVM.registerInfoData.password.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Parola Tekrar", textfieldText: $registerVM.registerInfoData.passwordConfirm.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    Spacer()
                        .padding(.bottom)
                    MFAIButton(buttontitle: RegisterModel.Constants.buttonTextRegister,buttonBackgroundColor: .buttonGreen){
                        if registerVM.registerInfoData.password == registerVM.registerInfoData.passwordConfirm {
                            Task {
                                await registerVM.getRegisterRequest()
                            }
                        } else {
                            AlertManager.showAlert(title: "Hata", message: "Şifreler aynı değil")
                        }
                    }
                    .padding(.bottom, 20)
                    MFAIText(title: PersonalInfosModel.ButtonTextContext.haveAnAccount )
                        .onTapGesture {
                            coordinator.show(.login)
                        }
                }
                .navigationBarBackButtonHidden(true)
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return RegisterView()
        .environmentObject(env)
}
