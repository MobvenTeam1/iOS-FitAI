//
//  FocusAreaView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct FocusAreaView: View {
    @ObservedObject var exerciseVM: ExerciseProgramViewModel
    @Binding var progressBarValue: Double
    @State var focusArea = ["Hepsi","Kolar","Göğüs","Bel","Kalça","Bacaklar"]
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.focusAreaViewtitle)
                MFAIMultipleSelectionView(selectionList: $focusArea, selections: $exerciseVM.exerciseProgramData.focusArea)
                Spacer()
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextCreate){
                    exerciseVM.pageStep = .specialPlan
                }
            }
        }
    }
}

#Preview {
    FocusAreaView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
