//
//  SFECustomButton.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct SFECustomButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                (isSelected ? Color.green177_235 : Color.white)
                    .frame(height: 38)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                Text(title)
                    .font(.urbanistSemibold(size: 15))
                    .foregroundColor(Color.black11_11)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(width: 163.5)
    }
}
