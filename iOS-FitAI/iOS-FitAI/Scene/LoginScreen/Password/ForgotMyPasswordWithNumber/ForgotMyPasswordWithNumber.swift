//
//  ForgotMyPasswordWithNumber.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 31.05.2024.
//

import SwiftUI

struct ForgotMyPasswordWithNumber: View {
    @EnvironmentObject var gsmNumber: GSMNumber
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                FMPNumberTextView()
                FMPNumberTextField()
                Spacer()
                FMPNumberSendCodeButton()
               FMPLoginWithEmailButton()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.bottom, 27)
            .customLogoButton()
            .customBackButton()
        }
    }
}

#Preview {
    ForgotMyPasswordWithNumber()
        .environmentObject(GSMNumber())
        .environmentObject(CheckIfOTPCorrect())
}
