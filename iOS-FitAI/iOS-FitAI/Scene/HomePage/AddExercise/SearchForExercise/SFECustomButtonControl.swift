//
//  SFECustomButtonControl.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct SFECustomButtonControl: View {
    @Binding var selectedButton: String
    let buttons: [String]
   
    var body: some View {
        HStack(spacing: 0) {
            ForEach(buttons, id: \.self) { button in
                SFECustomButton(title: button, isSelected: selectedButton == button) {
                    selectedButton = button
                       
                }
                    
            }
        }
    }
}
