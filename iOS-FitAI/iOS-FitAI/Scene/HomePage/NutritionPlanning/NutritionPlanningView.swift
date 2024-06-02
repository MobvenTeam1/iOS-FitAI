//
//  NutritionPlanningView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct NutritionPlanningView: View {
    // TODO: Veri geldiğinde bunları arraye çevirip gelen verinin sayısına göre foreach içerisinde düzenleme yap.
    let headerImageName: String
    let foodImageName: String
    let foodName: String
    let secondaryText: String // Burası gelecek veriye göre 2 ayrı stringe bölünebilir.
    var body: some View {
        VStack(spacing: 12) {
            Text("Besinler")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black26_27)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 52)
            VStack(spacing: 8) {
            ForEach(0..<5) { _ in
                    ZStack {
                        Color.white
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 1, y: 1)
                        HStack {
                            Image(foodImageName)
                            VStack(alignment: .leading) {
                                Text(foodName)
                                    .font(.urbanistBold(size: 16))
                                    .foregroundStyle(.black)
                                Text(secondaryText)
                                    .font(.urbanistRegular(size: 14))
                            }
                            Spacer()
                            Image("setlerimage")
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 287, height: 74)
                }
            }
            .padding(.top, 4)
            NavigationLink {
                HomePageView()
            }label: {
                ZStack {
                    Color.green177_235
                        .frame(width: 327, height: 56)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Text("Öğünü Tamamla")
                        .font(.urbanistSemibold(size: 16))
                        .foregroundStyle(Color.black11_11)
                }
            }
        }
    }
}

#Preview {
    NutritionPlanningView(headerImageName: "kahvaltı2", foodImageName: "yumurta", foodName: "Haşlanmış Yumurta", secondaryText: "2 tane 180 kcal")
}
