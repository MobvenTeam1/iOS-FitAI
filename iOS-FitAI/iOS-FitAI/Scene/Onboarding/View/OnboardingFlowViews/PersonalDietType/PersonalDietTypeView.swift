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
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading){
                Image("PersonalDietType")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalDietTypeView)
                    MFAIText(title: OnboardingModel.ContentConstants.personalDietTypeViewContent)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip){
                        onboardingScreen.pageStep = .personalExercise
                    }
                }
            }
        }
    }
}

#Preview {
    PersonalExerciseView(onboardingScreen: OnboardingViewModel())
}

