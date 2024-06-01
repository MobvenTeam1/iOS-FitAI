//
//  CreateNewPasswordTextView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct CreateNewPasswordTextView: View {
    var body: some View {
        Text("Yeni parola oluştur")
            .font(.urbanistBold(size: 30))
            .foregroundColor(Color.black11_11)
            .padding(.top, 28)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 33)
        Text("Yeni parolanız daha önce kullandıklarınızdan farklı olmalıdır.")
            .font(.urbanistMedium(size: 16))
            .foregroundColor(Color.black102_102)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 33)
    }
}

#Preview {
    CreateNewPasswordTextView()
}
