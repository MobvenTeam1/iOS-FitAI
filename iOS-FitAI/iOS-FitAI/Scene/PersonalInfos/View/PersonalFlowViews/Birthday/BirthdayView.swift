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
                HStack{
                    Button {
                        personalInfoVM.pageStep = .height
                    }
                        label: {
                        Image("back")
                                .resizable()
                                .frame(width: 41, height: 41)
                                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    Button {}
                        label: {
                        Image("Onboarding-5-Icon")
                                .resizable()
                                .frame(width: 41, height: 41)
                                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
                .padding(20)
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.birthdayViewTitle)
                HStack(spacing: 20) {
                    Text(birthDate.formatted(.dateTime.day()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Text(birthDate.formatted(.dateTime.month()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Text(birthDate.formatted(.dateTime.year()))
                        .font(.system(size: 13, weight: .semibold))
                        .padding(12)
                        .border(.calenderBorder)
                    Image("calender")

                        .border(.calenderBorder)
                }
                .padding(8)
                .foregroundColor(.black)
                .overlay {
                    DatePicker(selection: $birthDate, displayedComponents: .date) {}
                        .labelsHidden()
                        .contentShape(Rectangle())
                        .opacity(0.011)             // <<< here
                }
                .padding(.bottom, 500)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.16
                    personalInfoVM.pageStep = .targets
                }
                .padding(.bottom, 30)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    BirthdayView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
