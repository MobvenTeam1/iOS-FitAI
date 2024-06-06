//
//  CheckIfSearching.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct CheckIfSearching: View {
    let searchText: String
    @Binding var selectedButton: String
    let buttons: [String]
    let searchResults: [Any]
    var body: some View {
        if searchText.isEmpty {
            SFECustomButtonControl(selectedButton: $selectedButton, buttons: buttons)
                .padding(.top, 33)
        }
        else {
            HStack {
                Text("Sonuçlar")
                    .font(.urbanistBold(size: 18))
                    .foregroundStyle(Color.black29_30)
                Spacer()
                
                if searchText.isEmpty {
                    Text("0 adet")
                        .font(.urbanistSemibold(size: 14))
                        .foregroundStyle(Color.gray150_150)
                }
                else {
                    Text("\(searchResults.count) adet")
                        .font(.urbanistSemibold(size: 14))
                        .foregroundStyle(Color.gray150_150)
                }
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    AddExerciseView()
        .environmentObject(AppState())
}
