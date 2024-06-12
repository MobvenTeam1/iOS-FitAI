//
//  LoginView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct LoginView: View {
//    @State private var email: String = ""
    @State private var rememberMeClicked: Bool = false
//    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @StateObject var loginVM = LoginVM()
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                WelcomeTextView()
//                EmailTextField(showError: $showError, errorMessage: $errorMessage, email: $email)
                EmailTextField(showError: $showError, errorMessage: $errorMessage, email: $loginVM.loginInfoData.email.toUnwrapped(defaultValue: ""))
//                GenericPasswordView(password: $password, placeholder: "Parola")
                GenericPasswordView(password: $loginVM.loginInfoData.password.toUnwrapped(defaultValue: ""), placeholder: "Parola")
                HStack {
                    RememberMeSection(rememberMeClicked: $rememberMeClicked)
                    Spacer()
                    ForgotPasswordLink()
                }
//                LoginButton(email: email,
//                            password: password,
//                            showError: $showError,
//                            errorMessage: $errorMessage
//                )
                LoginButton(email: loginVM.loginInfoData.email ?? "",
                            password: loginVM.loginInfoData.password ?? "",
                            showError: $showError,
                            errorMessage: $errorMessage,
                            loginVM: loginVM
                )
                
                
                DividerWithText()
                SocialLoginButtons()
                Spacer()
                SignUpLink()
            }
            .padding(.horizontal, 24)
            .customLogoButton()
            .customBackButton()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
