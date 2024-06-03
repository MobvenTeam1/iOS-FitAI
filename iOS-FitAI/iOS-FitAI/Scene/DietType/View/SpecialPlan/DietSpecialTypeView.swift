//
//  DietSpecialTypeView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 2.06.2024.
//

import SwiftUI

struct DietSpecialTypeView: View {
    @ObservedObject var dietVM: DietTypeViewModel
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("specialEllipse")
                    .resizable()
                    .frame(width: 176, height: 176)
                    
                MFAIText(title: DietTypeModel.Constants.specialPlanViewTitle)
                    .bold()
                    .font(.title2)
                    .padding()
                MFAIText(title: DietTypeModel.Constants.specialPlanViewContent)
                Spacer()
            }
        }
        
    }
}

#Preview {
    DietSpecialTypeView(dietVM: DietTypeViewModel())
}
