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
                        PasswordCriteriaView(text: "bir büyük, ", isValid: containsUppercase(registerVM.registerInfoData.password.toEmpty) || !validatePassword)
                        PasswordCriteriaView(text: "bir küçük harften oluşmalıdır.", isValid: containsLowercase(registerVM.registerInfoData.password.toEmpty) || !validatePassword)
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
                            Image(.ellipse)
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
                        if registerVM.registerInfoData.password == registerVM.registerInfoData.passwordConfirm {
                            Task {
                                await registerVM.getRegisterRequest()
                            }
                            // TODO: Check if it's success to navigate
                            //a
                            coordinator.show(.personalInfos)
                            //b
                        } else {
                            AlertManager.showAlert(title: "Hata", message: "Şifreler aynı değil")
                        }
                        validatePassword = true
                        createPassword()
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
    func createPassword() {
        confirmPasswordError = nil
        if registerVM.registerInfoData.password.toEmpty.isEmpty || registerVM.registerInfoData.passwordConfirm.toEmpty.isEmpty {
            confirmPasswordError = "Parola boş kalamaz."
            return
        }
        if registerVM.registerInfoData.password.toEmpty.count < 8 || !containsUppercase(registerVM.registerInfoData.password.toEmpty) || !containsLowercase(registerVM.registerInfoData.password.toEmpty) {
            return
        }
        if registerVM.registerInfoData.password.toEmpty != registerVM.registerInfoData.passwordConfirm.toEmpty {
            confirmPasswordError = "Parolalarınız eşleşmiyor."
            return
        }
        passwordSetSuccessfully = true
    }
    private func containsUppercase(_ text: String) -> Bool {
        let uppercaseLetters = CharacterSet.uppercaseLetters
        return text.unicodeScalars.contains { uppercaseLetters.contains($0) }
    }
    private func containsLowercase(_ text: String) -> Bool {
        let lowercaseLetters = CharacterSet.lowercaseLetters
        return text.unicodeScalars.contains { lowercaseLetters.contains($0) }
    }
}
#Preview {
    @State var env = Coordinator<FlowRouter>()
    return RegisterView()
        .environmentObject(env)
}
