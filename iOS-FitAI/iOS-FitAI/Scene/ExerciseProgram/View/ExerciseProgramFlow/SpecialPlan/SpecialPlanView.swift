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
                Image(systemName: "circlebadge.fill")
                    .resizable()
                    .frame(width: 176, height: 176)
                
                MFAIText(title: ExerciseProgramModel.Constants.specialPlansViewTitle)
                MFAIText(title: ExerciseProgramModel.Constants.specialPlansViewContent)
                Spacer()
            }
        }
    }
}

#Preview {
    SpecialPlanView(exerciseVM: ExerciseProgramViewModel())
}
