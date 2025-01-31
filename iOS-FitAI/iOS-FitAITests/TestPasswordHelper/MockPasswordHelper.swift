//
//  MockPasswordHelper.swift
//  iOS-FitAITests
//
//  Created by Ahmet Yasin Atakan on 17.06.2024.
//

import XCTest
import Foundation

final class MockPasswordHelper: PasswordHelperProtocol {
    func createPassword(password: String, confirmPassword: String, onError: @escaping (String) -> Void, onSuccess: @escaping () -> Void) {
        if password.isEmpty || confirmPassword.isEmpty {
            onError("Parola boş kalamaz.")
            return
        }
        if password.count < 8 || !containsUppercase(password) || !containsLowercase(password) {
            onError("Parola en az 8 karakter uzunluğunda olmalı ve büyük/küçük harf içermelidir.")
            return
        }
        if password != confirmPassword {
            onError("Parolalarınız eşleşmiyor.")
            return
        }
        onSuccess()
    }
    
    func containsUppercase(_ text: String) -> Bool {
        let uppercaseLetters = CharacterSet.uppercaseLetters
        return text.unicodeScalars.contains { uppercaseLetters.contains($0) }
    }
    
    func containsLowercase(_ text: String) -> Bool {
        let lowercaseLetters = CharacterSet.lowercaseLetters
        return text.unicodeScalars.contains { lowercaseLetters.contains($0) }
    }
}
