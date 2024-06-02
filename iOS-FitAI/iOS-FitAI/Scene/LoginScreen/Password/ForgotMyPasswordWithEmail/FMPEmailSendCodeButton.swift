//
//  FMPSendCodeButton.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct FMPEmailSendCodeButton: View {
    var body: some View {
        NavigationLink {
            OTPEmail()
        }label: {
            ZStack {
                Color.green177_235
                    .frame(width: 327, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Text("Kod Gönder")
                    .foregroundStyle(Color.black11_11)
                    .font(.urbanistSemibold(size: 16))
            }
        }
    }
}

#Preview {
    FMPEmailSendCodeButton()
}
