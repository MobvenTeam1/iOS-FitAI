//
//  OnboardingView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct OnboardingView: View {
   @StateObject var viewmodel = OnboardingViewModel()
    var body: some View {
        ZStack{
            VStack{
                if viewmodel.pageStep == .personalTarget{
                    PersonalTargetView(onboardingScreen: viewmodel)
                }else if viewmodel.pageStep == .personalDietType{
                    PersonalDietTypeView(onboardingScreen: viewmodel)
                }else if viewmodel.pageStep == .personalExercise{
                    PersonalExerciseView(onboardingScreen: viewmodel)
                }else if viewmodel.pageStep == .dailyCalorie{
                    DailyCalorieView(onboardingScreen: viewmodel)
                }else if viewmodel.pageStep == .onboarding5 { Onboarding5View(onboardingScreen: viewmodel, personalInfoVM: PersonalInfosViewModel())
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
