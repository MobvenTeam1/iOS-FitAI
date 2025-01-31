//
//  Onboarding5.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI
// figma screen size: 375, 812
struct Onboarding5: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry  in
                ZStack(alignment: .topLeading) {
                    Image("womentalking")
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack() {
                        Image("fitaiimage")
                            .resizable()
                            .frame(width: 72, height: 81)
                            .offset(y: -40)
                        Image("FitAIText")
//                            .resizable()
//                            .frame(width: 107, height: 72)
                            .offset(y: -40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    VStack {
                        Button {
                        } label: {
                            ZStack {
                                Color.green177_235
                                Text("Kayıt Ol")
                                    .font(.urbanistSemibold(size: 16))
                                    .foregroundStyle(Color.black11_11)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 14.5)
                            .padding(.top, 60)
                        }
                        NavigationLink {
                            LoginView()
                        } label: {
                            ZStack {
                                Color.white
                                Text("Giriş Yap")
                                    .font(.urbanistSemibold(size: 16))
                                    .foregroundStyle(Color.black11_11)
                            } .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black11_11, lineWidth: 1)
                            )
                            .frame(width: geometry.size.width / 1.2, height: geometry.size.height / 14.5)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.leading, geometry.size.width / 15.625)
                    .padding(geometry.size.width / 37.5)
                    .padding(.top, geometry.size.height / 1.5)
                }
            }
        }
    }
}

#Preview {
    Onboarding5()
        .environmentObject(AppState())
}
