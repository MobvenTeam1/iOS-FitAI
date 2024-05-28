//
//  WeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.
//

import SwiftUI

struct CurrentWeightView: View {
    @ObservedObject var personelInfoVM: PersonalInfosViewModel
    @Binding var weightValue: String
    @Binding var progressBarValue: Double
    
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.weightViewTitle)
                Spacer(minLength: 50)
                MFAITextField(title: "String", textfieldText: $weightValue)
                Spacer()
                MFAIButton(buttontitle: "Kaydet"){
                    progressBarValue += 0.2
                }
            }
        }
    }
}

#Preview {
    CurrentWeightView(personelInfoVM: PersonalInfosViewModel(), weightValue: .constant(""), progressBarValue: .constant(0.2))
}
