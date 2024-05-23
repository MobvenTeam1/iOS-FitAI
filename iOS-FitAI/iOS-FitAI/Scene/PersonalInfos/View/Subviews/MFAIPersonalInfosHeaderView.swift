//
//  MFAIPersonalInfosHeaderView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAIPersonalInfosHeaderView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
            .foregroundStyle(.black)
            .padding(.leading)
            Spacer(minLength: 10)
        }
    }
}

#Preview {
    MFAIPersonalInfosHeaderView(title: "Title")
}
