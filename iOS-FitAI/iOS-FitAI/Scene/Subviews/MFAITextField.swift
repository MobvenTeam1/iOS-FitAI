//
//  MFAITextField.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAITextField: View {
    let title: String
    var keyboardType: UIKeyboardType = .default
    @State private var isFocused: Bool = false

    @Binding var textfieldText: String
    
    var body: some View {
        TextField(title, text: $textfieldText)
            .keyboardType(keyboardType)
            .padding(.leading, 18)
            .frame(width: 327, height: 56)
            .background {
                Color.welcomeTextField
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
    }
}

#Preview {
    MFAITextField(title: "String", textfieldText: .constant(""))
}
