//
//  PersonalExerciseView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct PersonalExerciseView: View {
    @ObservedObject var onboardingScreen: OnboardingViewModel
    var body: some View {
            ZStack{
                Image("PersonalExercise")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalExerciseView)
                        .font(.title)
                        .bold()
                        .padding(.trailing, 120)
                    MFAIText(title: OnboardingModel.ContentConstants.personalExerciseViewContent)
                        .padding(.top, -25)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip,buttonBackgroundColor: .white){
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
                            onboardingScreen.pageStep = .dailyCalorie
                        }else if value.translation.width > 50 {
                            onboardingScreen.pageStep = .personalDietType
                        }
                    }
                )
    }
}

#Preview {
    PersonalExerciseView(onboardingScreen: OnboardingViewModel())
}
