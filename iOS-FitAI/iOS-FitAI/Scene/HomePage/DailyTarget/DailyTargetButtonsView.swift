//
//  DailyTargetButtonsView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct DailyTargetButtonsView: View {
    let imageName: String
    let text: String
    let action: (() -> Void)
    var body: some View {
        Button {
            action()
        }label: {
            ZStack {
                Color.white.ignoresSafeArea()
                HStack {
                    Image(imageName)
                    Text(text)
                        .font(.urbanistBold(size: 14))
                }
                .foregroundStyle(.black)
            }
            .frame(width: 159.5, height: 48)
            .cornerRadius(12)
        }
        .shadow(color: Color.black.opacity(0.05), radius: 50, x: 1, y: 1)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(white: 246.0 / 255.0), lineWidth: 1)
        )
    }
}

#Preview {
    HomePageView()
}
