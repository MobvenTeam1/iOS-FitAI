//
//  Onboarding5View.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 31.05.2024.
//

import SwiftUI

struct Onboarding5View: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @ObservedObject var onboardingScreen = OnboardingViewModel()
    @ObservedObject var personalInfoVM = PersonalInfosViewModel()
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .topLeading){
                Image("Onboarding-5")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Image("Onboarding-5-Icon")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    
                    MFAIText(title: "FitAI")
                    Spacer()
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextRegister){
                        personalInfoVM.pageStep = .welcome
                    }
                    MFAIButton(buttontitle: OnboardingModel.ButtonContent.buttonTextLogin)
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        coordinator.show(.personalInfos)
                    })
                })
            }
        }
    }
}

#Preview {
    Onboarding5View(onboardingScreen: OnboardingViewModel(), personalInfoVM: PersonalInfosViewModel())
        .environmentObject(Coordinator<FlowRouter>())
}
