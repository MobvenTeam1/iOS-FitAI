//
//  DurationForExercise.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 6.06.2024.
//

import SwiftUI

struct DurationForExercise: View {
    @State private var durationForExercise: Int? = nil
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Egzersiz Süresi")
                    .font(.urbanistBold(size: 24))
                    .foregroundStyle(Color.black11_11)
                HStack(spacing: -16) {
                    TextField("Süre", value: $durationForExercise, formatter: NumberFormatter() )
                        .keyboardType(.numberPad)
                        .frame(width: 100, alignment: .center)
                        .font(.urbanistBold(size: 24))
                        .foregroundStyle(Color.black11_11)
                    Text("Dakika")
                        .font(.urbanistBold(size: 24))
                        .foregroundStyle(Color.black11_11)
                }
                .padding(.top, 16)
                Color.gray184_184
                    .frame(width: 144, height: 1)
                    .presentationDetents([.large, .fraction(0.4) ])
                GreenButtonView(text: "Sonraki") {
                    appState.isAddExerciseButtonTapped = true
                    dismiss()
                }
                .padding(.top, 2)
                
            }
        }
    }
}
