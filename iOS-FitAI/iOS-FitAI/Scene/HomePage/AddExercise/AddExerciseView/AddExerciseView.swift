//
//  AddExerciseView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct AddExerciseView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                AddHeaderView(text: "Egzersiz Ekle")
                SearchForExerciseView()
            }
        }
        .ignoresSafeArea()
        .toolbar(.hidden)
    }
}

#Preview {
    AddExerciseView()
        .environmentObject(AppState())
}
