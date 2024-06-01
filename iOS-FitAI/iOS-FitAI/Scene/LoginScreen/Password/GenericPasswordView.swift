//
//  PasswordView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct GenericPasswordView: View {
    @State private var isPasswordVisible: Bool = false
    @Binding var password: String
    var placeholder: String
    var body: some View {
        HStack {
            if isPasswordVisible {
                TextField("", text: $password)
                    .placeholder(when: password.isEmpty, placeholder: {
                        Text(placeholder)
                    })
            } else {
                SecureField("", text: $password)
                    .placeholder(when: password.isEmpty, placeholder: {
                        Text(placeholder)
                    })
            }
            Button {
                isPasswordVisible.toggle()
            }label: {
                Image( isPasswordVisible ? "şifreaçık" : "şifrekapalı")
                    .padding(.trailing, 18)
                    .foregroundStyle(Color.black102_102)
            }
        }
        .padding(.leading, 18)
        .frame(width: 327, height: 56)
        .background(Color.white247_248)
        .overlay(
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray232_232)
        )
    }
}
