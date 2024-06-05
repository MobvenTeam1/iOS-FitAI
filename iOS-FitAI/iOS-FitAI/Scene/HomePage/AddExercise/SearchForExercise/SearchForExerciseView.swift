//
//  SearchForExerciseView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct SearchForExerciseView: View {
    @State private var searchText: String = ""
    @State private var selectedButton = "Geçmiş"
    @EnvironmentObject var appState: AppState
    let exercises = [
        Exercise(name: "Yürüyüş", secondaryText: "Düşük Tempo - 1 saatte 65 kcal", imageName: "yürüyüş"),
        Exercise(name: "Koşu", secondaryText: "1 saatte 178 kcal", imageName: "koşu"),
        Exercise(name: "Bisiklet", secondaryText: "1 saatte 325 kcal", imageName: "bisiklet"),
        Exercise(name: "Yüzme", secondaryText: "1 saatte 350 kcal", imageName: "yüzme"),
        Exercise(name: "Tenis", secondaryText: "1 saatte 280 kcal", imageName: "tenis")
    ]
    let buttons = ["Geçmiş", "Favoriler"]

    private var searchResults: [Exercise] {
        searchText.isEmpty ? exercises : exercises.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
                .ignoresSafeArea()
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30)))
                .offset(y: -40)
            
            VStack {
                AddExerciseSearchBar(text: $searchText)
                    .padding(.top, 16)
                if appState.isAddExerciseButtonTapped {
                    MyExerciseView()
                        .padding(.top, 32)
                    CheckIfSearching(searchText: searchText, selectedButton: $selectedButton, buttons: buttons, searchResults: searchResults)
                        .padding(.top, 112)
                } else {
                    CheckIfSearching(searchText: searchText, selectedButton: $selectedButton, buttons: buttons, searchResults: searchResults)
                }
                
                ScrollView {
                    ForEach(searchResults) { result in
                        SFECard(exercise: result)
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    SearchForExerciseView()
        .environmentObject(AppState())
}

