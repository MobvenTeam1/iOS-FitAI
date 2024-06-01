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
        ZStack{
            VStack{
                Image("FitAISplashScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 84, height: 84)
                
                HStack{
                    Text("Fit")
                    Text("AI").bold()
                    
                }
            }.onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    coordinator.show(.onboarding)
                })
            })
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(Coordinator<FlowRouter>())
}
