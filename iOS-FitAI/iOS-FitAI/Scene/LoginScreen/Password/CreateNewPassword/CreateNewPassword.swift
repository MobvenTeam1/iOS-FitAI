//
//  CreateNewPassword.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct CreateNewPassword: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var passwordSetSuccessfully = false
    @State private var confirmPasswordError: String?
    @State private var validatePassword: Bool = false
    private var passwordHelper: PasswordHelperProtocol
    init(passwordHelper: PasswordHelperProtocol = PasswordHelper()) {
        self.passwordHelper = passwordHelper
    }
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                CreateNewPasswordTextView()
                GenericPasswordView(password: $password, placeholder: "Parola")
                    .padding(.top, 22)
                HStack(spacing: 0) {
                    PasswordCriteriaView(text: "Min 8 karakter, ", isValid: password.count >= 8 || !validatePassword)
                    PasswordCriteriaView(text: "bir büyük, ", isValid: passwordHelper.containsUppercase(password) || !validatePassword)
                    PasswordCriteriaView(text: "bir küçük harften oluşmalıdır.", isValid: passwordHelper.containsLowercase(password) || !validatePassword)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 42)
                .padding(.bottom, -0)
                GenericPasswordView(password: $confirmPassword, placeholder: "Parola Tekrar")
                if let confirmPasswordError = confirmPasswordError {
                    Text(confirmPasswordError)
                        .font(.urbanistRegular(size: 12))
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 42)
                }
                Spacer()
                GreenButtonView(text: "Parolayı Sıfırla") {
                    validatePassword = true
                    passwordHelper.createPassword(password: password,
                                                         confirmPassword: confirmPassword,
                                                         onError: { error in
                        confirmPasswordError = error
                    },
                                                         onSuccess: {
                        passwordSetSuccessfully = true
                    })
                }
                NavigationLink("", destination: PasswordChangedView(), isActive: $passwordSetSuccessfully)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .customLogoButton()
            .toolbar(.hidden)
        }
    }
}

#Preview {
    CreateNewPassword()
        .environmentObject(AppState())
}

