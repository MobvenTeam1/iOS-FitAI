//
//  MFAIText.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 27.05.2024.
//

import SwiftUI

struct MFAIText: View {
    let title: String
    
    var body: some View {
        Text(title)
            .padding(20)
            .padding(.trailing)
            
    }
}

#Preview {
    MFAIText(title: "Günlük yediklerinizi kaydedin, kalori takibi ile sağlıklı alışkanlıklar edinin")
}
