//
//  StartButton.swift
//  FitAI-Project
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct StartButton: View {
    @Binding var showAnimation: Bool
    var body: some View {
        GreenButtonView(text: "Başla") {
            showAnimation = true
        }
    }
}
