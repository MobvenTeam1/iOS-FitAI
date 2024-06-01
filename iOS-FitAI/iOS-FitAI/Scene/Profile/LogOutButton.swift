//
//  LogOutButton.swift
//
//  Created by Ahmet Yasin Atakan on 1.06.2024.

import SwiftUI

struct LogOutButton: View {
    var body: some View {
        Button {
            
        }label: {
            ZStack {
                Color.white
                    .frame(width: 327, height: 56)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 40, x: 2, y: 2)
                Text("Çıkış Yap")
                    .font(.urbanistSemibold(size: 16))
                    .foregroundStyle(Color.black11_11)
            }
            .padding(.leading, 24)
        }
    }
}

#Preview {
    LogOutButton()
}
