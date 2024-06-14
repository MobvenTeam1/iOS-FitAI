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
    @State var sportOptionsIcon = ["all","yoga","fitness","plates","walking","running"]
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.sportOptionsViewTitle)
                Spacer()
                MFAISingleSelectionView(selectionList: $sportOptions, selectionIconList: $sportOptionsIcon, selection: $exerciseVM.exerciseProgramData.preferredActivities.toUnwrapped(defaultValue: ""))
                    .padding(.bottom, 8)
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    exerciseVM.pageStep = .sportFrequency
                }
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .onAppear(perform: {
                progressBarValue = 0.33
            })
        }
    }
}

#Preview {
    SportOptionsView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
