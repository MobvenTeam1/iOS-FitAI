//
//  LoginView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginVM()
    @State private var email: String = ""
    @State private var rememberMeClicked: Bool = false
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
//    @State private var isLoginSuccessful: Bool = false
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                WelcomeTextView()
                EmailTextField(showError: $showError, errorMessage: $errorMessage, email: $viewmodel.loginInfoData.email.toUnwrapped(defaultValue: ""))
                GenericPasswordView(password: $viewmodel.loginInfoData.password.toUnwrapped(defaultValue: ""), placeholder: "Parola")
                HStack {
                    RememberMeSection(rememberMeClicked: $rememberMeClicked)
                    Spacer()
                    ForgotPasswordLink()
                }
                
                LoginButton(email: email,
                            password: password,
                            showError: $showError,
                            errorMessage: $errorMessage,
                            loginVM: viewmodel)
                
                DividerWithText()
                SocialLoginButtons()
                Spacer()
                SignUpLink()
            }
            .padding(.horizontal, 24)
            .customLogoButton()
            .customBackButton()
//            .navigationDestination(isPresented: $isLoginSuccessful) {
//                HomePageView()
//            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
