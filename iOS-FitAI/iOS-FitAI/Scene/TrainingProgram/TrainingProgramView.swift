//
//  TrainingProgramView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 14.06.2024.
//

import SwiftUI

struct TrainingProgramView: View {
    var body: some View {
        VStack {
            ZStack {
                Image(.topOfTrainingProgram)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 324)
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .offset(x: -150, y: -100)
                    .foregroundStyle(.white)
                Image(.closeX)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .offset(x: 150, y: -100)
            }
            //            .frame(maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            HStack {
                ZStack(alignment: .top) {
                    Color.white
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                    VStack {
                        HStack {
                            Text("Zaman")
                                .font(.urbanistBold(size: 16))
                                .foregroundStyle(Color.black26_27)
                            Spacer()
                            Image(.dailycalorie)
                        }
                        .padding(.horizontal)
                        .offset(y: 10)
                        HStack {
                            Text("45")
                                .font(.urbanistBlack(size: 32))
                                .foregroundColor(.black26_27)
                            Text("Dakika")
                                .font(.urbanistSemibold(size: 14))
                                .foregroundStyle(Color.black102_102)
                        }
                        .padding(.trailing, 44)
                    }
                }
                .frame(width: 160, height: 92)
                .padding()
                ZStack {
                    Color.white
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                    VStack {
                        HStack {
                            Text("Kalori")
                                .font(.urbanistBold(size: 16))
                                .foregroundStyle(Color.black26_27)
                            Spacer()
                            Image(.dailycalorie)
                        }
                        .padding(.horizontal)
                        .offset(y: 10)
                        HStack {
                            Text("275")
                                .font(.urbanistBlack(size: 32))
                                .foregroundColor(.black26_27)
                            Text("Kcal")
                                .font(.urbanistSemibold(size: 14))
                                .foregroundStyle(Color.black102_102)
                        }
                        .padding(.trailing, 44)
                    }
                    
                }
                .frame(width: 160, height: 92)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .offset(y: -60)
            ZStack {
                Color.white
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                VStack(spacing: 24) {
                    Text("Koşu Detayı")
                        .font(.urbanistBold(size: 18))
                        .foregroundStyle(Color.black26_27)
                        .padding(.trailing, 200)
                    Text("- Öncesinde 3 dakikalık ısınma hareketi,\n  sonrasında 3 dakikalık bir soğuma\n  hareketi kaslarının çalışmasına yardımcı\n  olacaktır. ")
                    Text("- Koşu boyunca **2 dakika yüksek tempo 2\n  dakika düşük** tempo koşu yapmak\n  başlangıç seviyesi için sana yardımcı\n  olacaktır")
                }
                .font(.urbanistMedium(size: 14))
                .foregroundStyle(Color.black11_11)
            }
            .frame(width: 327, height: 264)
            .offset(y: -60)
            GreenButtonView(text: "Antrenmana Başla") {
                
            }
            .offset(y: -20)
        }
    }
        
}

#Preview {
    TrainingProgramView()
}
