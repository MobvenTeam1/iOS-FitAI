//
//  HeightWeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.


import SwiftUI

struct HeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State private var heightInput: String = ""  // Kullanıcıdan alınan inputu saklamak için geçici bir değişken
    
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.heightViewTitle)
                MFAITextField(title: "155 cm",
                              keyboardType: .decimalPad,
                              textfieldText: $heightInput)
                .padding(.bottom, 450)
                
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen) {
                    if let heightDouble = Double(heightInput) {
                        personalInfoVM.personalInfoData.height = heightDouble
                        personalInfoVM.pageStep = .currentWeight
                    } else {
                        AlertManager.showAlert(title: "Error", message: "Invalid height input")
                    }
                   
                }
                .padding(30)
            }
            .onAppear {
                progressBarValue = 0.2
            }
        }
    }
}

#Preview {
    HeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}

