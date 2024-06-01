//
//  OTPEmail.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct OTPEmail: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Doğrulama")
                    .font(.urbanistBold(size: 30))
                    .foregroundStyle(Color.black11_11)
                Text("E-posta adresinize gönderdiğimiz doğrulama kodunu girin.")
                    .foregroundStyle(Color.black102_102)
                    .font(.urbanistMedium(size: 16))
                OTPTextField(numberOfFields: 4)
                    .frame(maxWidth: .infinity, alignment: .center)
                CountdownTimerView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 22)
            .customLogoButton()
            .customBackButton()
        }
    }
}

#Preview {
    OTPEmail()
        .environmentObject(CheckIfOTPCorrect())
}
