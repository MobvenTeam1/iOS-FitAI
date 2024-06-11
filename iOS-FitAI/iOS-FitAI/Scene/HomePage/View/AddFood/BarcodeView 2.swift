//
//  BarcodeView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 6.06.2024.
//

import SwiftUI

struct BarcodeView: View {
    let imageName: [String]
    let text: [String]
    var body: some View {
        HStack {
            ForEach(0..<2, id:\.self) { index in
                ZStack {
                    Color.white
                        .frame(width: 158, height: 108)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                    VStack {
                        Image(imageName[index])
                        Text(text[index])
                    }
                }
            }
        }
        .padding(.top, 24)
    }
}
