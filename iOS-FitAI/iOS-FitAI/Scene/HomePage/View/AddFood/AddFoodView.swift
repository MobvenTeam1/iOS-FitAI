//
//  AddFoodView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 6.06.2024.
//

import SwiftUI

struct AddFoodView: View {
    @State private var searchText: String = ""
    let buttons = ["Geçmiş", "Favoriler"]
    @State private var selectedButton = "Geçmiş"
    
    private var searchResults: [AddFood] {
        searchText.isEmpty ? AddFood.sampleFoods : AddFood.sampleFoods.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            AddHeaderView(text: "Besin Ekle")
            ZStack {
                Color.white
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30)))
                .offset(y: -40)
                VStack {
                    AddSearchBar(text: $searchText)
                        .padding(.top, 24)
                        .padding(.horizontal, 24)
                    BarcodeView(imageName: ["scanfood","scanbarcode"],
                                text: ["Besin Tara", "Barkod Tara"])
                    CheckIfSearching(searchText: searchText,
                                     selectedButton: $selectedButton,
                                     buttons: buttons,
                                     searchResults: searchResults)
                    .padding(.horizontal, 24)
                    .padding(.top, -22)
                    ForEach(searchResults) { food in
                        AddFoodCard(addFood: food)
                    }
                    .padding(.top, 12)
                }
            }
            
        }
        .ignoresSafeArea()
        .toolbar(.hidden)
    }
}

#Preview {
    AddFoodView()
}
