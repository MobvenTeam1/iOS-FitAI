//
//  CardView.swift
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct CardView: View {
    var userName: String
    var signUpDate: String
    var body: some View {
        ZStack {
            Color.green177_235.ignoresSafeArea()
                .cornerRadius(12)
            VStack {
                ZStack {
                    Image("profileimage2")
                        .clipShape(Circle())
                    Image("pencil")
                        .padding(.top, 55)
                        .padding(.leading, 55)
                }
                .offset(y: -50)
                VStack {
                    Text(userName)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .foregroundStyle(Color.black11_11)
                    Text("\(signUpDate)'ten beri üye")
                        .foregroundStyle(Color.black102_102)
                        .font(.system(size: 12))
                    
                }
                .offset(y: -50)
                HStack {
                    Text("Hedef")
                    Spacer()
                    Text("Kilo Verme, Kas Yapma")
                }
                .offset(y: -18)
                Color.green203_242.ignoresSafeArea()
                    .frame(width: 287, height: 1)
                    .offset(y: -18)
                HStack {
                    Text("Rozetler")
                    Spacer()
                    ForEach(0..<4) { _ in
                        Color.green231_249.ignoresSafeArea()
                            .frame(width: 29, height: 30)
                            .clipShape(Circle())
                        
                    }
                }
                .offset(y: -18)
            }
            .padding(.horizontal, 18)
        }
        .frame(width: 327, height: 210)
    }
}


#Preview {
    CardView(userName: "Jane Doe", signUpDate: "5 Mayıs 2024")
}
