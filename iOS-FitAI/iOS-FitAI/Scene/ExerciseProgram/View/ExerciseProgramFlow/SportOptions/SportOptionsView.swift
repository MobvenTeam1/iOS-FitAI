//
//  SportOptionsView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct SportOptionsView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    @Binding var progressBarValue: Double
    @State var sportOptions = ["Hepsi","Yoga","Fitness","Pilates","Yürüyüş","Koşu"]
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.sportOptionsViewTitle)
                MFAIMultipleSelectionView(selectionList: $sportOptions, selections: $exerciseVM.exerciseProgramData.sportOption)
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .sportFrequency
                }
            }
        }
    }
}

#Preview {
    SportOptionsView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
