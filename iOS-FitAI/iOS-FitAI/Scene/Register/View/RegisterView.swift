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
    @EnvironmentObject var appState: AppState
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
                
                    MFAIPersonalInfosHeaderView(title: RegisterModel.Constants.welcomeViewTitle)
                        .font(.urbanistBold(size: 30))
                        .bold()
                    MFAIText(title: RegisterModel.Constants.welcomeViewContent)
                        .padding(.trailing, 46)

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
                    
                    MFAITextField(title: "Parola", textfieldText: $registerVM.registerInfoData.password.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    
                    MFAITextField(title: "Parola Tekrar", textfieldText: $registerVM.registerInfoData.passwordConfirm.toUnwrapped(defaultValue: ""))
                        .frame(width: 327, height: 56)
                    HStack{
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
                        }
                        MFAIText(title: PersonalInfosModel.Constants.conditionAndPrivacy)
                            .font(.caption)
                            .onTapGesture {
                                registerVM.kVKKEnabled.toggle()
                            }
                    }
                    .padding(.top, 4)
                    MFAIButton(buttontitle: RegisterModel.Constants.buttonTextRegister,buttonBackgroundColor: .buttonGreen){
                        if registerVM.registerInfoData.password == registerVM.registerInfoData.passwordConfirm {
                            Task {
                                await registerVM.getRegisterRequest()
                            }
                            //a
                            appState.userName = registerVM.registerInfoData.firstName ?? "Simgee"
                            coordinator.show(.personalInfos)
                            //b
                        } else {
                            AlertManager.showAlert(title: "Hata", message: "Şifreler aynı değil")
                        }
                        // TODO: Handle
//                        if AppStorageManager.shared.userToken != "" {
//                        appState.userName = registerVM.registerInfoData.firstName ?? "Simgee"
//                            print("Register DEBUg: ", AppStorageManager.shared.userToken)
//                            coordinator.show(.personalInfos)
//                    }
//                        else {
//                            AlertManager.showAlert(title: "Kullanıcı kaydı mevcut", message: "")
//                        }
                    }
                    .padding(.top, 8)
                    MFAIText(title: PersonalInfosModel.ButtonTextContext.haveAnAccount )
                        .onTapGesture {
                            coordinator.show(.login)
                        }
                        .padding(.top,5)
                }
                .navigationBarBackButtonHidden(true)
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button(action: {
//                            coordinator.show(.onboarding5)
//                        }
//                               , label: {
//                            Image("back")
//                                .resizable()
//                                .frame(width: 41, height: 41)
//                        })
//                    }
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Image("Onboarding-5-Icon")
//                            .resizable()
//                            .frame(width: 32, height: 36)
//                    }
//                }
            }
        }
    }
}
#Preview {
    @State var env = Coordinator<FlowRouter>()
    return RegisterView()
        .environmentObject(env)
}
