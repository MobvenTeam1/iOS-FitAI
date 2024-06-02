//
//  ScreenModeView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 30.05.2024.
//

import SwiftUI

struct ScreenModeView: View {
    var imageName: [String]
    var actions: [() -> Void]
    var body: some View {
        HStack {
            ForEach(0..<imageName.count, id: \.self) { index in
                Button {
                    actions[index]()
                }label: {
                    Image(imageName[index])
                }
            }
        }
    }
}
