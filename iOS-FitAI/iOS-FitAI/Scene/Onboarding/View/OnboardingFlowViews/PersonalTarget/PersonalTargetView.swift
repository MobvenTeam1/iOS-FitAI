//
//  PersonalTargetView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct PersonalTargetView: View {
    @ObservedObject var onboardingScreen: OnboardingViewModel
    var body: some View {
        ZStack{
            Image("PersonalTarget")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalTargetView)
                        .font(.title)
                        .bold()
                        .padding(.trailing)
                    MFAIText(title: OnboardingModel.ContentConstants.personalTargetViewContent)
                        .padding(.top, -40)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip,buttonBackgroundColor:
                        .white)
                        {
                        onboardingScreen.pageStep = .onboarding5
                }
                        .padding(.bottom, 100 )
            }
                .navigationBarBackButtonHidden(true)
        }
    .gesture(
        DragGesture()
            .onEnded { value in
                if value.translation.width < -50 {
                    onboardingScreen.pageStep = .personalDietType
                }
            }
        )
    }
}

#Preview {
    PersonalTargetView(onboardingScreen: OnboardingViewModel())
}
