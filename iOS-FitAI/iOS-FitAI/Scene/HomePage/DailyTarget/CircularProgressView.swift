//
//  CircularProgressView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 15.05.2024.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: CGFloat {
        guard totalKgToLose > 0 else { return 0 }
        return CGFloat(kgToLoseForTarget) / CGFloat(totalKgToLose)
    }
    @State var totalKgToLose: Double
    @State var kgToLoseForTarget: Double
    var isActivated: Bool {
        progress > 0
    }
    var body: some View {
        ZStack {
            Circle()
                .stroke (
                    Color.gray232_232,
                    lineWidth: 5
                )
                .frame(width: 165, height: 165)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke (
                    Color.green177_235,
                    style: StrokeStyle(
                    lineWidth: 12,
                    lineCap: .round
                )
                    )
                .animation(.linear, value: progress)
                .frame(width: 165, height: 165)
                .rotationEffect(.degrees(-90))
            Circle()
                .stroke(
                    isActivated ? Color.green177_235.opacity(0) : Color.green177_235.opacity(1),
                    style: StrokeStyle(
                        lineWidth: 12,
                        lineCap: .round
                        )
                    )
                .frame(width: 5, height: 5)
                .offset(x: 0, y: -82)
            VStack {
                Text("Hedef\nTamamlama")
                    .font(.urbanistBold(size: 14))
                    .foregroundStyle(Color.black26_27)
                    .multilineTextAlignment(.center)
                Text(String(format: "%%%.f", kgToLoseForTarget / totalKgToLose * 100))
                    .font(.urbanistBlack(size: 44))
                    .foregroundStyle(Color.black11_11)
            }
        }
        .padding(.top, 18)
    }
}

#Preview {
    CircularProgressView(totalKgToLose: 1000, kgToLoseForTarget: 720)
}
