//
//  DurationForExercise.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 6.06.2024.
//

import SwiftUI

struct DurationForExercise: View {
    let exercise: Exercise
    @State private var totalDuration: String = "0"
    @State private var durationForExercise: String = ""
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var swiftDataModel: MyModelViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Egzersiz Süresi")
                    .font(.urbanistBold(size: 24))
                    .foregroundStyle(Color.black11_11)
                HStack(spacing: -16) {
                    TextField("Süre", text: $durationForExercise)
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
                GreenButtonView(text: "Sonraki") {
                    updateExerciseDuration()
                    appState.isaddExerciseButtonTapped = false
                    dismiss()
                }
                .padding(.top, 2)
            }
        }
    }

    private func updateExerciseDuration() {
            if let newDuration = Int(durationForExercise) {
                if let existingIndex = swiftDataModel.items.firstIndex(where: { $0.name == exercise.name }) {
                    // Update existing exercise duration
                    if let existingDuration = Int(swiftDataModel.items[existingIndex].duration) {
                        swiftDataModel.items[existingIndex].duration = String(existingDuration + newDuration)
                    } else {
                        swiftDataModel.items[existingIndex].duration = String(newDuration)
                    }
                } else {
                    // Add new exercise if not exists
                    let newExercise = Exercise(name: exercise.name, secondaryText: exercise.secondaryText, imageName: exercise.imageName, calorie: exercise.calorie, duration: durationForExercise)
                    swiftDataModel.appendItem(newExercise)
                }
                swiftDataModel.objectWillChange.send() // Notify views of change
            }
        }
}

#Preview {
    AddExerciseView()
        .environmentObject(AppState())
}
