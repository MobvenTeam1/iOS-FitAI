//
//  ForgotMyPasswordWithEmail.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI

struct ForgotMyPasswordWithEmail: View {
    @State private var email: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                FMPEmailTextView()
                FMPEmailTextField(email: $email)
                Spacer()
                FMPEmailSendCodeButton()
                FMPLoginWithNumberButton()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.bottom, 27)
            .customLogoButton()
            .customBackButton()
        }
    }
}

#Preview {
    ForgotMyPasswordWithEmail()
}
