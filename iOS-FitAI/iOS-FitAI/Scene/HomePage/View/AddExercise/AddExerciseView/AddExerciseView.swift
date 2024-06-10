//
//  AddExerciseView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct AddExerciseView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                    AddHeaderView(text: "Egzersiz Ekle")
                    SearchForExerciseView()
                }
            }
        .ignoresSafeArea()
        .toolbar(.hidden)
        .blur(radius: appState.isaddExerciseButtonTapped ? 10: 0)
    }
}

#Preview {
    AddExerciseView()
        .environmentObject(AppState())
        .environmentObject(MyModelViewModel())
}
