//
//  AddExerciseSearchBar.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct AddSearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.black102_102)
            TextField("", text: $text)
                .placeholder(when: text.isEmpty, placeholder: {
                    Text("Ara")
                })
                .autocapitalization(.none)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black26_27, lineWidth: 1)
                .frame(width: 327, height: 52)
        )
        .padding(.horizontal, 33)
    }
}
