//
//  BirthdayView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 28.05.2024.
//

import SwiftUI

struct BirthdayView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State var birthDate = Date.now
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.birthdayViewTitle)
                HStack(spacing: 20) {
                    Text(birthDate.formatted(.dateTime.day()))
                        .font(.system(size: 13, weight: .semibold))
                    Text(birthDate.formatted(.dateTime.month()))
                        .font(.system(size: 13, weight: .semibold))
                    Text(birthDate.formatted(.dateTime.year()))
                        .font(.system(size: 13, weight: .semibold))
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 9, weight: .bold))
                }
                .padding(8)
                .foregroundColor(.black)
                .overlay {
                    DatePicker(selection: $birthDate, displayedComponents: .date) {}
                        .labelsHidden()
                        .contentShape(Rectangle())
                        .opacity(0.011)             // <<< here
                }
                Spacer()
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .targets
                }
            }
        }
    }
}

#Preview {
    BirthdayView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
