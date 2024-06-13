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
    //a
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    //b
    var body: some View {
        ZStack{
            VStack{

                  MFAIPersonalInfosHeaderView(title: ExerciseProgramModel.Constants.focusAreaViewtitle)
                  Spacer()
                  MFAIMultipleSelectionView(selectionList: $focusArea, selectionIconList: $focusAreaIcon, selections:     $exerciseVM.exerciseProgramData.directArea)
                      .padding(.bottom, 8)
                  MFAIButton(buttontitle: ExerciseProgramModel.ButtonTextContext.buttonTextCreate,buttonBackgroundColor: .buttonGreen){
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
