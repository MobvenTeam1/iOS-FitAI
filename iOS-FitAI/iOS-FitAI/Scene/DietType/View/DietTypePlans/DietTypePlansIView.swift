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
                Image("specialEllipse")
                    .resizable()
                    .frame(width: 176, height: 176)
                
                MFAIText(title: DietTypeModel.Constants.dietTypePlansViewTitle)
                    .bold()
                    .font( .title2)
                    .padding()
                MFAIText(title: DietTypeModel.Constants.dietTypePlansViewContent)
                Spacer()
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextStart,buttonBackgroundColor: .buttonGreen ){
                    dietVM.pageStep = .knownHealthProblem
                }
            }
        }
    }
}

#Preview {
    DietTypePlansIView(dietVM: DietTypeViewModel())
}
