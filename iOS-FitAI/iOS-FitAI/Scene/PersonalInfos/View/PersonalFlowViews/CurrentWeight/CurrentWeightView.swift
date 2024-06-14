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
    @State private var currentWeightInput: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.currentWeightViewTitle)
                MFAITextField(title: "55 kg",
                              keyboardType: .decimalPad,
                              textfieldText: $currentWeightInput)
                .padding(.bottom, 450)
                
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen) {
                    if let currentWeightDouble = Double(currentWeightInput) {
                        personalInfoVM.personalInfoData.firstWeight = currentWeightDouble
                        personalInfoVM.pageStep = .targetWeight
                    } else {
                        AlertManager.showAlert(title: "Error", message: "Invalid weight input")
                    }
                    
                }
                .padding(30)
            }
            .onAppear {
                progressBarValue = 0.4
            }
        }
    }
}

#Preview {
    CurrentWeightView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
