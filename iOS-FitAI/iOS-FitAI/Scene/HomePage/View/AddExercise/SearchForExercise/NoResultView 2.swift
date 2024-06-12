//
//  NoResultView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 9.06.2024.
//

import SwiftUI

struct NoResultView: View {
    let firstText: String
    let secondText: String
    var body: some View {
        VStack(spacing: 14) {
            Circle()
                .frame(width: 176, height: 176)
                .foregroundStyle(Color.gray232_232)
            Text(firstText)
                .font(.urbanistBold(size: 26))
                .foregroundStyle(Color.black11_11)
            Text(secondText)
                .font(.urbanistMedium(size: 15))
                .foregroundStyle(Color.black102_102)
            GreenButtonView(text: "Egzersiz Tanımla") {
            }
            .padding(.top, 10)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    NoResultView(firstText: "123", secondText: "Aradığınız egzersiz kaydı verilerimizde bulunamadı. Aşağıdaki butondan egzersiz tanımlayabilirsiniz.")
}
