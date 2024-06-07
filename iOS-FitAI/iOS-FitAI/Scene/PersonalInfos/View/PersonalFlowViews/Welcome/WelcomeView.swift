//
//  WelcomeView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 31.05.2024.
//

import SwiftUI

//struct WelcomeView: View {
//    @ObservedObject var personalInfoVM: PersonalInfosViewModel
//    var body: some View {
//        ZStack{
//            ScrollView{
//                VStack{
//                    MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.welcomeViewTitle)
//                    MFAIText(title: PersonalInfosModel.Constants.welcomeViewContent)
//                    Spacer()
//                    MFAITextField(title: "Ad", textfieldText: $personalInfoVM.personalInfoData.firstname.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                        
//                    
//                    MFAITextField(title: "Soyad", textfieldText: $personalInfoVM.personalInfoData.lastName.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                    
//                    MFAITextField(title: "Kullanıcı Adı", textfieldText: $personalInfoVM.personalInfoData.username.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                    
//                    
//                    MFAITextField(title: "E-posta",keyboardType: .emailAddress, textfieldText: $personalInfoVM.personalInfoData.email.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                    
//                    MFAITextField(title: "Parola", textfieldText: $personalInfoVM.personalInfoData.password.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                    
//                    MFAITextField(title: "Parola Tekrar", textfieldText: $personalInfoVM.personalInfoData.passwordConfirm.toUnwrapped(defaultValue: ""))
//                        .frame(width: 327, height: 56)
//                    Spacer()
//                    HStack{
//                        if personalInfoVM.kVKKEnabled{
//                            Image(.on)
//                                .resizable()
//                                .frame(width: 17, height: 17)
//                                .scaledToFill()
//                        }else {
//                            Image(.ellipse)
//                                .resizable()
//                                .frame(width: 17, height: 17)
//                                .scaledToFill()
//                        }
//                        MFAIText(title: PersonalInfosModel.Constants.conditionAndPrivacy)
//                            .font(.caption)
//                            .onTapGesture {
//                                personalInfoVM.kVKKEnabled.toggle()
//                            }
//                    }
//                    .padding(.bottom)
//                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextRegister,buttonBackgroundColor: .buttonGreen){
//                        personalInfoVM.pageStep = .gender
//                    }
//                    .padding(.bottom, 20)
//                    MFAIText(title: PersonalInfosModel.ButtonTextContext.haveAnAccount )
//                        .onTapGesture {}
//                }
//                .navigationBarBackButtonHidden(true)
//            }
//            .scrollIndicators(.hidden)
//           
//        }
//    }
//}
//
//#Preview {
//    WelcomeView(personalInfoVM: PersonalInfosViewModel())
//}
