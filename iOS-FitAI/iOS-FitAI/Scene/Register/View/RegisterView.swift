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
    @State private var validatePassword: Bool = false
    @State private var confirmPasswordError: String?
    @State private var passwordSetSuccessfully = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    HStack{
                        Button {
                            coordinator.show(.onboarding5)
                        }label: {
                            Image("back")
                                .resizable()
                                .frame(width: 41, height: 41)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                        Button {
                        }label: {
                            Image("Onboarding-5-Icon")
                                .resizable()
                                .frame(width: 41, height: 41)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    }
                    .padding(.horizontal, 24)
                    
                    MFAIPersonalInfosHeaderView(title: RegisterModel.Constants.welcomeViewTitle)
                    
                    MFAIText(title: RegisterModel.Constants.welcomeViewContent)
                        .padding(.trailing, 23)
                        .font(.urbanistLight(size: 16))
                    MFAITextField(title: "Ad", textfieldText: $registerVM.registerInfoData.firstName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Soyad", textfieldText: $registerVM.registerInfoData.lastName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Kullanıcı Adı", textfieldText: $registerVM.registerInfoData.userName.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                        .autocapitalization(.none)
                    
                    MFAITextField(title: "E-posta",keyboardType: .emailAddress, textfieldText: $registerVM.registerInfoData.email.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                        .autocapitalization(.none)
                    
                    GenericPasswordView(password: $registerVM.registerInfoData.password.toUnwrapped(defaultValue: ""), placeholder: "Parola")
                    HStack(spacing: 0) {
                        PasswordCriteriaView(text: "Min 8 karakter, ", isValid: registerVM.registerInfoData.password.toEmpty.count >= 8 || !validatePassword)
                        PasswordCriteriaView(text: "bir büyük, ", isValid: PasswordHelper.shared.containsUppercase(registerVM.registerInfoData.password.toEmpty) || !validatePassword)
                        PasswordCriteriaView(text: "bir küçük harften oluşmalıdır.", isValid: PasswordHelper.shared.containsLowercase(registerVM.registerInfoData.password.toEmpty) || !validatePassword)
                    }
                    .padding(.trailing, 24)
                    GenericPasswordView(password: $registerVM.registerInfoData.passwordConfirm.toUnwrapped(defaultValue: ""), placeholder: "Parola Tekrar")
                    
                    HStack(spacing: -10) {
                        if registerVM.kVKKEnabled{
                            Image(.on)
                                .resizable()
                                .frame(width: 17, height: 17)
                                .scaledToFill()
                        }else {
                            Image(.nonSelectedCheck)
                                .resizable()
                                .frame(width: 17, height: 17)
                                .scaledToFill()
                                .overlay(
                                    Circle()
                                        .stroke(.black)
                                )
                        }
                        MFAIText(title: PersonalInfosModel.Constants.conditionAndPrivacy)
                            .font(.urbanistRegular(size: 14))
                            .onTapGesture {
                                registerVM.kVKKEnabled.toggle()
                            }
                    }
                    .padding(.top, -5)
                    .padding(.leading, 16)
                    MFAIButton(buttontitle: RegisterModel.Constants.buttonTextRegister,buttonBackgroundColor: .buttonGreen){
                        validatePassword = true
                        PasswordHelper.shared.createPassword(password: registerVM.registerInfoData.password.toEmpty,
                                                             confirmPassword: registerVM.registerInfoData.passwordConfirm.toEmpty,
                                                             onError: { error in
                            confirmPasswordError = error
                            
                        },
                                                             onSuccess: {
                            passwordSetSuccessfully = true
                        })
                        if registerVM.registerInfoData.password == registerVM.registerInfoData.passwordConfirm, passwordSetSuccessfully {
                            Task {
                                await registerVM.getRegisterRequest()
                            }
                            
                        } else {
                            AlertManager.showAlert(title: "Hata", message: "Şifreler Gereken Koşulları Sağlamıyor")
                        }
                    }
                    .onChange(of: registerVM.isRegisterSuccessful) { isSuccessful in
                        if isSuccessful {
                            coordinator.show(.personalInfos)
                        }
                    }
                    .padding(.top, 8)
                    
                    MFAIText(title: PersonalInfosModel.ButtonTextContext.haveAnAccount )
                        .onTapGesture {
                            coordinator.show(.login)
                        }
                        .padding(.top, 12)
                        .font(.urbanistRegular(size: 15))
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return RegisterView()
        .environmentObject(env)
}
