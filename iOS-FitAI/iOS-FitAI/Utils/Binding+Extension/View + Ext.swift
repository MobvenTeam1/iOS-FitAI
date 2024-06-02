//
//  View + Ext.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

extension View {
    func applyEnvironmentObjects(gsmNumber: GSMNumber, checkIfOTPCorrect: CheckIfOTPCorrect , appState: AppState) -> some View {
        self
            .environmentObject(gsmNumber)
            .environmentObject(checkIfOTPCorrect)
            .environmentObject(appState)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            .foregroundStyle(Color.black102_102)
            .font(.urbanistMedium(size: 16))
            self
        }
    }
}
