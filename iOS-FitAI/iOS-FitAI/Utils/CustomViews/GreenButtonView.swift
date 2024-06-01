//
//  GreenButtonView.swift
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct GreenButtonView: View {
    let text: String
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        }label: {
            ZStack {
                Color.green177_235
                    .frame(width: 327, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text(text)
                    .font(.urbanistSemibold(size: 16))
                    .foregroundStyle(Color.black11_11)
            }
        }
    }
}
