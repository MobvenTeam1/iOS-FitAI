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
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading){
                Image("DailyCalorie")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    MFAIText(title: OnboardingModel.Constants.dailyCalorieView)
                        .font(.title)
                        .bold()
                        .frame(alignment: .leading)
                    
                    MFAIText(title: OnboardingModel.ContentConstants.dailyCalorieViewContent)
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextSkip){
                        onboardingScreen.pageStep = .onboarding5
                    }
                    
                }
            }
        }
    }
}

#Preview {
    DailyCalorieView(onboardingScreen: OnboardingViewModel())
}
