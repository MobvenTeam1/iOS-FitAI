//
//  KnownHealthProblemView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct KnownHealthProblemView: View {
    @ObservedObject var dietVM: DietTypeViewModel
    @Binding var progressBarValue: Double
    @State var knownHealthProblem = ["Çölyak","Diyabet Tip 2","Diyabet Tip 1","Tansiyon","Alerji / İntölerans"]
    @State var knownHealthProblemIcon = ["","","","",""]
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: DietTypeModel.Constants.knownHealthProblemViewTitle)
                Spacer()
                MFAIMultipleSelectionView(selectionList: $knownHealthProblem, selectionIconList: $knownHealthProblemIcon, selections: $dietVM.dietTypeData.knownHealthProblem)
                Spacer()
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextNo, buttonBackgroundColor: .white){
                    progressBarValue += 0.30
                    dietVM.pageStep = .foodAllergy
                }
                    .padding(40)
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextNext,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.30
                    dietVM.pageStep = .foodAllergy
                }
                
            }
        }
    }
}

#Preview {
    KnownHealthProblemView(dietVM: DietTypeViewModel(), progressBarValue: .constant(0.35))
}
