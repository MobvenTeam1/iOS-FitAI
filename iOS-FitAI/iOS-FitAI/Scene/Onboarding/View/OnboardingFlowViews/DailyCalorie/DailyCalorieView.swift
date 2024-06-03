//
//  DailyCalorieView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct DailyCalorieView: View {
    @ObservedObject var onboardingScreen: OnboardingViewModel
    var body: some View {
            ZStack{
                Image("DailyCalorie")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.dailyCalorieView)
                        .font(.title)
                        .bold()
                        .padding(.trailing, 175)
                    MFAIText(title: OnboardingModel.ContentConstants.dailyCalorieViewContent)
                        .padding(.top, -25)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip, buttonBackgroundColor: .white){
                        onboardingScreen.pageStep = .onboarding5
                    }
                    .padding(.bottom, 100)
                }
                .navigationBarBackButtonHidden(true)

            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -50 {
                            onboardingScreen.pageStep = .onboarding5
                        }else if value.translation.width > 50 {
                            onboardingScreen.pageStep = .personalExercise
                        }
                    }
                )
    }
}

#Preview {
    DailyCalorieView(onboardingScreen: OnboardingViewModel())
}
