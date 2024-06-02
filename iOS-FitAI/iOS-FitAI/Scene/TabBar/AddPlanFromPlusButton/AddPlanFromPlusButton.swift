//
//  AddFromPlusButton.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.

import SwiftUI

struct AddPlanFromPlusButton: View {
    let imageName: [String]
    let firstText: [String]
    let action: [(() -> Void)]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("AI Destekli Plan Ekle")
                    .font(.urbanistSemibold(size: 24))
                    .foregroundStyle(Color.black11_11)
                Spacer()
                Button {
                    dismiss()
                }label: {
                    Image("aiassistscreenX")
                }
            }
            .padding(.horizontal, 24)
            ForEach(0..<imageName.count, id: \.self) { index in
                Button {
                    action[index]()
                }label: {
                    ZStack {
                        Color.white
                            .frame(width: 327, height: 74)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
                        HStack {
                            Image(imageName[index])
                                .resizable()
                                .frame(width: 46, height: 46)
                                .padding(.leading, 24)
                            VStack(alignment: .leading) {
                                Text(firstText[index])
                                    .font(.urbanistBold(size: 16))
                                    .foregroundStyle(Color.black11_11)
                                Text("AI size özel plan oluştursun")
                                    .font(.urbanistRegular(size: 14))
                                    .foregroundStyle(Color.black102_102)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(width: 327, height: 74)
                }
            }
        }
    }
}
