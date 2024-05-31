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
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading){
                Image("PersonalExercise")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalExerciseView)
                    MFAIText(title: OnboardingModel.ContentConstants.personalExerciseViewContent)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip){
                        onboardingScreen.pageStep = .dailyCalorie
                    }
                }
            }
        }
    }
}

#Preview {
    PersonalExerciseView(onboardingScreen: OnboardingViewModel())
}
