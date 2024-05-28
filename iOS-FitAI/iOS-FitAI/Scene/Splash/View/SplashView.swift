//
//  SplashView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>

    var body: some View {
        Text("Hello, World!")
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    coordinator.show(.personalInfos)
                })
            })
    }
}

#Preview {
    SplashView()
}
