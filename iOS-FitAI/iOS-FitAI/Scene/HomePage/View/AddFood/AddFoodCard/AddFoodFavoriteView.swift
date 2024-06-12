//
//  AddFoodFavoriteView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 11.06.2024.
//

import SwiftUI

struct AddFoodFavoriteView: View {
    @EnvironmentObject var swiftDataVM: AddFoodViewModel
    @State private var isButtonTapped: Bool = false
    @State private var isFoodFavorited: Bool = false
    var body: some View {
        ForEach(0..<swiftDataVM.items.count, id: \.self) { index in
            ZStack {
                Color.white
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                HStack {
                    ZStack {
                        Color.white247_248
                            .frame(width: 40, height: 50)
                            .cornerRadius(8)
//                        Image(addFood.imageName ?? "")
                        Image(swiftDataVM.items[index].imageName ?? "")
                    }
                    VStack(alignment: .leading) {
//                        Text(addFood.name)
                        Text(swiftDataVM.items[index].name )
                            .font(.urbanistBold(size: 16))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                        Text(addFood.secondaryText)
                        Text(swiftDataVM.items[index].secondaryText )
                            .font(.urbanistRegular(size: 14))
                            .foregroundColor(Color.black102_102)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    HStack {
                        Button {
                            swiftDataVM.removeItem(at: index)
                        }label: {
                            ZStack {
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundStyle(Color.white247_248)
                                Image(systemName: isFoodFavorited ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .foregroundStyle(.black)
                            }
                        }
                        Button {
                            isButtonTapped = true
                         
                        }label: {
                            ZStack {
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundStyle(Color.white247_248)
                                Image("plustabbar")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .frame(width: 327, height: 82)
            .padding(.top, 12)
            
            
        }
    }
}

#Preview {
    AddFoodFavoriteView()
        .environmentObject(AddFoodViewModel())
}
