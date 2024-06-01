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
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: DietTypeModel.Constants.knownHealthProblemViewTitle)
                MFAIMultipleSelectionView(selectionList: $knownHealthProblem, selections: $dietVM.dietTypeData.knownHealthProblem)
                
            }
        }
    }
}

#Preview {
    KnownHealthProblemView(dietVM: DietTypeViewModel(), progressBarValue: .constant(0.35))
}
