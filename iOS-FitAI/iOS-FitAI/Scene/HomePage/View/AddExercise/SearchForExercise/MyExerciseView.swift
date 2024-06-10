//
//  MyExerciseView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct MyExerciseView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var swiftDataModel: MyModelViewModel
    @State private var selectedExercise: Exercise? = nil
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
                            Text(String(swiftDataModel.items.count) + " Egzersiz")
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<swiftDataModel.items.count, id: \.self) { item in
                                HStack {
                                    ZStack {
                                        Color.white
                                            .frame(width: 58, height: 74)
                                            .cornerRadius(16)
                                            .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                                        Image(swiftDataModel.items[item].imageName)
                                        ZStack {
                                           Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundStyle(Color.gray232_232)
                                                .offset(x: 24, y: -24)
                                            Text(swiftDataModel.items[item].duration + "'")
                                                .font(.urbanistSemibold(size: 14))
                                                .foregroundStyle(Color.black102_102)
                                                .offset(x: 24, y: -24)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(swiftDataModel.items[item].name)
                                                .font(.urbanistBold(size: 16))
                                                .foregroundStyle(.black)
                                            Spacer()
                                            Button {
                                                swiftDataModel.removeItem(at: item)
                                            }label: {
                                                Image("aiassistscreenX")
                                            }
                                        }
                                        Text((swiftDataModel.items[item].duration ) + " Dakika")
                                            .font(.urbanistRegular(size: 14))
                                            .foregroundStyle(Color.black102_102)
                                        if let calorie = Int(swiftDataModel.items[item].calorie),
                                           let duration = Int(swiftDataModel.items[item].duration) {
                                            Text("\((calorie * duration) / 60) kcal")
                                                .font(.urbanistRegular(size: 14))
                                                .foregroundStyle(Color.black102_102)
                                        } else {
                                            Text("")
                                        }
                                    }
                                    .padding(.leading, 16)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
            .frame(height: 203)
            
        }
        .frame(width: 327,height: 171)
    }
}

#Preview {
    AddExerciseView()
        .environmentObject(MyModelViewModel())
        .environmentObject(AppState())
}
