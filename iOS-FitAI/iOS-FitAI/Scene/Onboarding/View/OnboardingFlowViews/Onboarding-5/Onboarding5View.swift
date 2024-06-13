//
//  Onboarding5View.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 31.05.2024.
//

import SwiftUI

struct Onboarding5View: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @ObservedObject var onboardingScreen: OnboardingViewModel
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    var body: some View {
        VStack(spacing: 16) {
            Spacer(minLength: 50)
            Image("Onboarding-5-Icon")
                .resizable()
                .frame(width: 72, height: 81, alignment: .center)
            Image(.fitAIText)
                .padding(.bottom, 180)
            MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextRegister, buttonBackgroundColor: .buttonGreen){
                personalInfoVM.pageStep = .welcome
                coordinator.show(.register)
            }
            .padding(.bottom, 30)
            MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextLogin,
                       buttonBackgroundColor: .white) {
                coordinator.show(.login)
            }
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black11_11, lineWidth: 1)
                .frame(width: 327, height: 56)
                
            )
        }
        .navigationBarBackButtonHidden(true)
        .padding(40)
        .padding(.bottom, 40)
        .background{
            Image(.onboarding5)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }.ignoresSafeArea()
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return Onboarding5View(onboardingScreen: OnboardingViewModel(), personalInfoVM: PersonalInfosViewModel())
        .environmentObject(env)
}
