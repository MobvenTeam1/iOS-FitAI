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
    @Binding var progressBarValue: Double
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.sportFrequencyViewTitle)
                MFAISingleSelectionView(selectionList: $sportFrequency, selection: $exerciseVM.exerciseProgramData.sportFrequency)
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .focusArea
                }
            }
        }
    }
}

#Preview {
    SportFrequencyView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
