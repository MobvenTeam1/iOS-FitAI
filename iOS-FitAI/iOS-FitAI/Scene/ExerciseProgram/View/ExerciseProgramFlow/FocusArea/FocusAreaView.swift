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
    @State var focusAreaIcon = ["all","arms","chest","waist","butt","leg"]
    @State private var tempString: String = ""
    //a
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    //b
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.focusAreaViewtitle)
                Spacer()
                MFAISingleSelectionView(selectionList: $focusArea, selectionIconList: $focusAreaIcon, selection: $exerciseVM.exerciseProgramData.focusAreas.toUnwrapped(defaultValue: ""))
                MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextCreate,buttonBackgroundColor: .buttonGreen){
                    
                    //aa
                                        Task {
                                            await exerciseVM.getExercise()
                                        }
                    //bb
                    
                    exerciseVM.pageStep = .specialPlan
                }
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
        }
    }
}


#Preview {
    FocusAreaView(exerciseVM: ExerciseProgramViewModel(), progressBarValue: .constant(0.25))
}
