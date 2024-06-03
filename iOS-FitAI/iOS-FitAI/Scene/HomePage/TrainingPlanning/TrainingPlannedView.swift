//
//  TrainingPlannedView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct TrainingPlannedView: View {
    var body: some View {
        VStack {
            Text("Setler")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black26_27)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 52)
            VStack(spacing: 8) {
            ForEach(0..<3) { _ in
                    ZStack {
                        Color.white
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 1, y: 1)
                        HStack {
                            Image("ısınmaseti")
                            VStack(alignment: .leading) {
                                Text("Isınma Seti")
                                    .font(.urbanistBold(size: 16))
                                    .foregroundStyle(Color.black11_11)
                                Text("Mat")
                                    .font(.urbanistRegular(size: 14))
                                    .foregroundStyle(Color.black102_102)
//
                            }
                            Spacer()
                            Image("setlerimage")
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 287, height: 74)
                }
            }
        }
    }
}

#Preview {
    TrainingPlannedView()
}
