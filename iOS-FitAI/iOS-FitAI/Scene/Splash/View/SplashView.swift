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
                Image(.fitAISplashScreen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 84, height: 84)
                
                HStack{
                    Text("Fit")
                        .padding(.trailing, -10)
                    Text("AI").bold()
                    
                }.frame(width: 107, height: 72, alignment: .center)
                    .font(.largeTitle)
                    .padding(.top, -20)
            }.onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    if ((AppStorageManager.shared.userToken?.isEmpty) != nil) {
                        coordinator.show(.onboarding)
                    }else {
                        coordinator.show(.onboarding)
                    }
                })
            })
        }
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return SplashView().environmentObject(env)
}
