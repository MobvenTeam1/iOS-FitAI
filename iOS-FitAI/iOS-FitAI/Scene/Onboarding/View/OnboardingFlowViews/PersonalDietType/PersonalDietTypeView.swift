//
//  PersonalDietTypeView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct PersonalDietTypeView: View {
    @ObservedObject var onboardingScreen: OnboardingViewModel
    var body: some View {
            ZStack{
                Image("PersonalDietType")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalDietTypeView)
                        .font(.title)
                        .bold()
                        .padding(.trailing, 50)
                    MFAIText(title: OnboardingModel.ContentConstants.personalDietTypeViewContent)
                        .padding(.top, -25)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip, buttonBackgroundColor: .white){
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
                            onboardingScreen.pageStep = .personalExercise
                        }else if value.translation.width > 50 {
                            onboardingScreen.pageStep = .personalTarget
                        }
                    }
                )
    }
}

#Preview {
    PersonalDietTypeView(onboardingScreen: OnboardingViewModel())
}

