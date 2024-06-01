//
//  PasswordChangedImageAndText.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct PasswordChangedImageAndText: View {
    var body: some View {
        Image("star")
            .resizable()
            .frame(width: 113.57, height: 105)
            .padding(.bottom, 43)
        Text("Parola Değiştirildi!")
            .font(.urbanistBold(size: 26))
            .foregroundStyle(Color.black11_11)
            .fontWeight(.bold)
        Text("Parolanız başarıyla değiştirildi. Yeni\nparolanızla hesabınıza giriş yapabilirsiniz.")
            .font(.urbanistMedium(size: 15))
            .foregroundStyle(Color.black102_102)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    PasswordChangedImageAndText()
}
