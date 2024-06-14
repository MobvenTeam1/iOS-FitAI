//
//  HandleScreens.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct HandleScreens: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        if appState.isLoginSuccessful {
            TabBarView()
        } else {
//            TabBarView()
            SplashView()
//            LoginView()
//            OnboardingView()
//            PersonalInfosView()
        }
    }
}

#Preview {
    HandleScreens()
        .environmentObject(AppState())
}
