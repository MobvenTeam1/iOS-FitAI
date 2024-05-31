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
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading){
                Image("PersonalTarget")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.personalTargetView)
                    MFAIText(title: OnboardingModel.ContentConstants.personalTargetViewContent)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip){
                        onboardingScreen.pageStep = .personalDietType
                    }
                }
            }
        }
    }
}

#Preview {
    PersonalTargetView(onboardingScreen: OnboardingViewModel())
}
