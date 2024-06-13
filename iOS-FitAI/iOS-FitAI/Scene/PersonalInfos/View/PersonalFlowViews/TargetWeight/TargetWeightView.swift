//
//  TargetWeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.


import SwiftUI

//struct TargetWeightView: View {
//    @ObservedObject var personalInfoVM: PersonalInfosViewModel
//    @Binding var progressBarValue: Double
//    var body: some View {
//        ZStack{
//            VStack{
//                
//                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetWeightViewTitle)
//                MFAITextField(title: "46kg", keyboardType: .decimalPad, textfieldText: $personalInfoVM.personalInfoData.goalWeight.toUnwrapped(defaultValue: ""))
//                .padding(.bottom, 400)
//                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
//                    personalInfoVM.pageStep = .birthDate
//                }
//                .padding(30)
//            }
//            .onAppear(perform: {
//                progressBarValue = 0.6
//                
//            })
//        }
//    }
//}
struct TargetWeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State private var targetWeightInput: String = ""  // Kullanıcıdan alınan inputu saklamak için geçici bir değişken
    
    var body: some View {
        ZStack {
            VStack {
                                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetWeightViewTitle)
                MFAITextField(title: "46 kg",
                              keyboardType: .decimalPad,
                              textfieldText: $targetWeightInput)
                .padding(.bottom, 450)
                
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen) {
                    if let targetWeightDouble = Double(targetWeightInput) {
                        personalInfoVM.personalInfoData.targetWeight = targetWeightDouble
                        personalInfoVM.pageStep = .birthDate
                    } else {
                        AlertManager.showAlert(title: "Error", message: "Invalid weight input")
                    }
                   
                }
                .padding(30)
            }
            .onAppear {
                progressBarValue = 0.6
            }
        }
    }
}

#Preview {
    TargetWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
