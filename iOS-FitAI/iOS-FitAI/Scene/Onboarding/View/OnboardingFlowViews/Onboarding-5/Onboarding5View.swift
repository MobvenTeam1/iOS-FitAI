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
        VStack{
            Spacer(minLength: 50)
            Image("Onboarding-5-Icon")
                .resizable()
                .frame(width: 72, height: 81,   alignment: .center)
            
            MFAIText(title: "FitAI")
            Spacer()
            MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextRegister, buttonBackgroundColor: .buttonGreen){
                personalInfoVM.pageStep = .welcome
            }
            .padding(.bottom, 30)
            MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextLogin,
                       buttonBackgroundColor: .white)
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .padding(40)
        .background{
            Image(.onboarding5)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }.ignoresSafeArea()
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                coordinator.show(.register)
            })
        })
        
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return Onboarding5View(onboardingScreen: OnboardingViewModel(), personalInfoVM: PersonalInfosViewModel())
        .environmentObject(env)
}
