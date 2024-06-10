//
//  CustomTabBarView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 30.05.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedIndex: Int
    var body: some View {
        HStack {
            TabBarButtonView(index: 0, selectedIndex: $selectedIndex, imageName: "günlük", selectedImageName: "günlük.fill", title: "Günlük")
                .padding(.trailing, -20)
            TabBarButtonView(index: 1, selectedIndex: $selectedIndex, imageName: "gelişim", selectedImageName: "gelişim.fill", title: "Gelişim")
            Spacer()
                .frame(width: 70, height: 83)
            TabBarButtonView(index: 2, selectedIndex: $selectedIndex, imageName: "discover", selectedImageName: "discover.fill", title: "Keşfet")
            TabBarButtonView(index: 3, selectedIndex: $selectedIndex, imageName: "profile", selectedImageName: "profile.fill", title: "Profile")
                .padding(.trailing, 20)
        }
    }
}

#Preview {
        TabBarView()
            .environmentObject(AppState())
}
