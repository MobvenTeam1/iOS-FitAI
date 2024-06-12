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
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.sportOptionsViewTitle)
                Spacer()
                MFAIMultipleSelectionView(selectionList: $sportOptions, selectionIconList: $sportOptionsIcon, selections: $exerciseVM.exerciseProgramData.sportOption)
                    .padding(.bottom, 8)
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.25
                    exerciseVM.pageStep = .workoutFrequency
                }
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .navigationBarBackButtonHidden(true)
               .toolbar {
                   ToolbarItem(placement: .topBarLeading) {
                       Button(action: {
                           exerciseVM.pageStep = .healthProblem
                       }, label: {
                           Image("back")
                               .resizable()
                               .frame(width: 41, height: 41)
                       })
                   }
               }
               .toolbar {
                         ToolbarItem(placement: .topBarTrailing) {
                                 Image("Onboarding-5-Icon")
                                     .resizable()
                                     .frame(width: 32, height: 36)
                         }
                     }
        }
    }
}

#Preview {
    SportOptionsView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
