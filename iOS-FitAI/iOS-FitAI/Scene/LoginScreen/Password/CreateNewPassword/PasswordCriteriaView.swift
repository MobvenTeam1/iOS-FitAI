//
//  PasswordCriteriaView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct PasswordCriteriaView: View {
    let text: String
    let isValid: Bool
    var body: some View {
        Text(text)
            .font(.urbanistRegular(size: 12))
            .foregroundColor(isValid ? Color.gray150_150 : .red)
            .padding(.bottom, 2)
    }
}
