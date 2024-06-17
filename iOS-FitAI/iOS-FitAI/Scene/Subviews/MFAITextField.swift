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
        ZStack {
            TextField("", text: $textfieldText)
                .placeholder(when: textfieldText.isEmpty, placeholder: {
                    Text(title)
                })
                .keyboardType(keyboardType)
                .padding(.leading, 18)
                .frame(width: 327, height: 56)
                .background {
                    Color.welcomeTextField
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray232_232, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
//            Image(.visiblepw)
        }
    }
}

#Preview {
//    MFAITextField(title: "String", textfieldText: .constant(""))
    @State var env = Coordinator<FlowRouter>()
    @State var passwordHelper = PasswordHelper()
    return RegisterView(passwordHelper: passwordHelper)
        .environmentObject(env)
}

