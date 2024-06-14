//
//  SportFrequencyView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct SportFrequencyView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    @State var sportFrequency = ["Bana önerilen kadar","Haftada 1-2","Haftada 3-4","Her gün"]
    @State var sportFrequencyIcon = ["","","",""]
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.sportFrequencyViewTitle)
                    Spacer()
                MFAISingleSelectionView(selectionList: $sportFrequency, selectionIconList: $sportFrequencyIcon, selection: $exerciseVM.exerciseProgramData.workoutFrequency.toUnwrapped(defaultValue: ""))
                    .padding(.bottom, 8)
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .directArea
                }
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .onAppear(perform: {
                progressBarValue = 0.66
            })
        }
    }
}

#Preview {
    SportFrequencyView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
