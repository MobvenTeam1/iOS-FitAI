//
//  LoginButton.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct LoginButton: View {
    var email: String
    var password: String
    @Binding var showError: Bool
    @Binding var errorMessage: String
    @Binding var isLoginSuccessful: Bool

    var body: some View {
        GreenButtonView(text: "Giriş Yap") {
            validateInputs()
        }
        .padding(.top, 12)
    }

    private func validateInputs() {
        if !isValidEmail(email) {
            showError = true
            errorMessage = "Lütfen geçerli bir e-posta adresi girin."
        } else if password.isEmpty {
            showError = true
            errorMessage = "Parola boş olamaz."
        } else if password.count < 8 {
            showError = true
            errorMessage = "Parola en az 8 karakter olmalıdır."
        } else {
            showError = false
            errorMessage = ""
            isLoginSuccessful = true
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
