//
//  AddExerciseHeaderView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct AddExerciseHeaderView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.9)
            HStack {
                Text("Egzersiz Ekle")
                    .font(.urbanistSemibold(size: 24))
                    .foregroundColor(.white)
                Spacer()
                Button {
                    dismiss()
                }label: {
                    Image("closeX")
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 1)
                                .frame(width: 41, height: 41)
                        )
                        .frame(width: 41, height: 41)
                }
            }
            .padding(.top, 73)
            .padding(.horizontal, 24)
        }
        .frame(width: UIScreen.main.bounds.width, height: 167)
    }
}

#Preview {
    AddExerciseHeaderView()
}
