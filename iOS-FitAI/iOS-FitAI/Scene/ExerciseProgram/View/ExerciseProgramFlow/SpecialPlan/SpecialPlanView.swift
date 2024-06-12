//
//  SpecialPlanView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct SpecialPlanView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("specialEllipse")
                    .resizable()
                    .frame(width: 176, height: 176)
                
                MFAIText(title: ExerciseProgramModel.Constants.specialPlansViewTitle)
                    .bold()
                    .font(.title2)
                    .padding(.bottom, -30)
                    .multilineTextAlignment(.center)
                MFAIText(title: ExerciseProgramModel.Constants.specialPlansViewContent)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .onAppear(perform: {
                Task{
                    await self.exerciseVM.getRegisterRequest()
                }
            })
        }
    }
}

#Preview {
    SpecialPlanView(exerciseVM: ExerciseProgramViewModel())
}
