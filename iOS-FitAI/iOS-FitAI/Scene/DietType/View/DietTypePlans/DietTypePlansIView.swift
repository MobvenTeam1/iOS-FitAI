//
//  DietTypePlansIView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct DietTypePlansIView: View {
    @ObservedObject var dietVM: DietTypeViewModel
    var body: some View {
    
        ZStack{
            VStack{
                Spacer()
                Image(systemName: "circlebadge.fill")
                    .resizable()
                    .frame(width: 176, height: 176)
                
                MFAIText(title: DietTypeModel.Constants.dietTypePlansViewTitle)
                MFAIText(title: DietTypeModel.Constants.dietTypePlansViewContent)
                Spacer()
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextStart){
                    dietVM.pageStep = .knownHealthProblem
                }
            }
        }
    }
}

#Preview {
    DietTypePlansIView(dietVM: DietTypeViewModel())
}
