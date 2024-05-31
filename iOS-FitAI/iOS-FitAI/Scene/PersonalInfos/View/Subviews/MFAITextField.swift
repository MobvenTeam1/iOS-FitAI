//
//  MFAITextField.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAITextField: View {
    let title: String
    @Binding var textfieldText: String
    var body: some View {
        TextField(title, text: $textfieldText)
            .keyboardType(.decimalPad)
            .padding()
    }
}

#Preview {
    MFAITextField(title: "String", textfieldText: .constant(""))
}
