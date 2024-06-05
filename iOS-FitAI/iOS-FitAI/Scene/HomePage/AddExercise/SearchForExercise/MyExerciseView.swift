//
//  MyExerciseView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct MyExerciseView: View {
    var body: some View {
        ZStack {
            Color.green177_235
                
                .cornerRadius(24)
                .offset(y: 120)
            HStack {
                ZStack {
                    Color.black11_11
                        .frame(width: 44, height: 32)
                        .cornerRadius(360)
                    Image("exclamation")
                }
                Text("Hedef kalorinizden 200 kcal fazla kalori harcadınız! Önerimiz:")
                    .font(.urbanistMedium(size: 14))
                    .foregroundStyle(Color.black29_30)
            }
            .offset(y: 160)
            ZStack {
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                VStack {
                    HStack {
                        VStack {
                            Text("Egzersizlerim")
                                .font(.urbanistBold(size: 18))
                                .foregroundStyle(Color.black29_30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("1 Egzersiz")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.urbanistRegular(size: 14))
                                .foregroundStyle(Color.black102_102)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        ZStack {
                            Color.black29_30
                                .frame(width: 58, height: 40)
                                .cornerRadius(25)
                            Image("weightlifting")
                        }
                        .padding(.top, 16)
                    }
                    HStack {
                        ZStack {
                            Color.white
                                .frame(width: 58, height: 74)
                                .cornerRadius(16)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                            Image("yürüyüş")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text("Yürüyüş")
                                .font(.urbanistBold(size: 16))
                                .foregroundStyle(.black)
                            Text("Düşük Tempo\n45 Dakika\n49 kcal")
                                .font(.urbanistRegular(size: 14))
                                .foregroundStyle(Color.black102_102)
                        }
                        .offset(x: -100)
                    }
                }
                .padding(.horizontal, 30)
                
            }
            .frame(width: 327, height: 203)
            
        }
        .frame(width: 327,height: 171)
    }
}

#Preview {
    MyExerciseView()
}
