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

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                CreateNewPasswordTextView()
                GenericPasswordView(password: $password, placeholder: "Parola")
                    .padding(.top, 22)
                HStack(spacing: 0) {
                    PasswordCriteriaView(text: "Min 8 karakter, ", isValid: password.count >= 8 || !validatePassword)
                    PasswordCriteriaView(text: "bir büyük, ", isValid: containsUppercase(password) || !validatePassword)
                    PasswordCriteriaView(text: "bir küçük harften oluşmalıdır.", isValid: containsLowercase(password) || !validatePassword)
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
                    createPassword()
                }
                NavigationLink("", destination: PasswordChangedView(), isActive: $passwordSetSuccessfully)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .customLogoButton()
            .toolbar(.hidden)
        }
    }

    func createPassword() {
        confirmPasswordError = nil
        if password.isEmpty || confirmPassword.isEmpty {
            confirmPasswordError = "Parola boş kalamaz."
            return
        }
        if password.count < 8 || !containsUppercase(password) || !containsLowercase(password) {
            return
        }
        if password != confirmPassword {
            confirmPasswordError = "Parolalarınız eşleşmiyor."
            return
        }
        passwordSetSuccessfully = true
    }
    private func containsUppercase(_ text: String) -> Bool {
        let uppercaseLetters = CharacterSet.uppercaseLetters
        return text.unicodeScalars.contains { uppercaseLetters.contains($0) }
    }
    private func containsLowercase(_ text: String) -> Bool {
        let lowercaseLetters = CharacterSet.lowercaseLetters
        return text.unicodeScalars.contains { lowercaseLetters.contains($0) }
    }
}

#Preview {
    CreateNewPassword()
        .environmentObject(GSMNumber())
        .environmentObject(CheckIfOTPCorrect())
}

