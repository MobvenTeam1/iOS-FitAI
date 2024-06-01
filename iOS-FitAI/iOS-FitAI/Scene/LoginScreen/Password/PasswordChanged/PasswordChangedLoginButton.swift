//
//  PasswordChangedLoginButton.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct PasswordChangedLoginButton: View {
    var body: some View {
        NavigationLink {
            LoginView()
        }
    label: {
        ZStack {
            Color.green177_235
                .frame(width: 327, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text("Giriş Yap")
                .font(.urbanistSemibold(size: 16))
                .foregroundStyle(Color.black11_11)
                .frame(width: 115, alignment: .top)
        }
    }
    }
}

#Preview {
    PasswordChangedLoginButton()
}
