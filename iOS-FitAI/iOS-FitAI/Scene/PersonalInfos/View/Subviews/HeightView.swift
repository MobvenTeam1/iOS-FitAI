//
//  HeightView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 27.05.2024.
//

import SwiftUI

struct HeightView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.heightViewTitle)
                Spacer(minLength: 50)
                MFAITextField(title: "String", textfieldText: $personalInfoVM.personalInfoData.height.toUnwrapped(defaultValue: ""))
                Spacer()
                MFAIButton(buttontitle: "Kaydet") {
                    progressBarValue += 0.2
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    HeightView(personalInfoVM: PersonalInfosViewModel(),progressBarValue: .constant(0.2))
}

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
