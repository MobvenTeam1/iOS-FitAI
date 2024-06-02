//
//  TabBarButtonView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 30.05.2024.
//

import SwiftUI

struct TabBarButtonView: View {
    let index: Int
    @Binding var selectedIndex: Int
    let imageName: String
    let selectedImageName: String
    let title: String
    
    var body: some View {
        Button(action: {
            selectedIndex = index
        }) {
            VStack {
                Image(selectedIndex == index ? selectedImageName : imageName)
                    .renderingMode(.template)
                Text(title)
                    .font(.custom("Poppins", size: 10))
            }
            .foregroundColor(selectedIndex == index ? .green177_235 : .black26_27)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    TabBarView()
}
