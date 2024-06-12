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
                .font(.urbanistBold(size: 30))
                .foregroundStyle(Color.black11_11)
                .padding(.top, 12)
                .padding(.leading, 32)
                .padding(.bottom, -16)
            Spacer(minLength: 10)
        }
    }
}

#Preview {
    MFAIPersonalInfosHeaderView(title: "Title")
}
