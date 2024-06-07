//
//  DietTypeView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 1.06.2024.
//

import SwiftUI

struct DietTypeView: View {
    @ObservedObject var dietVM: DietTypeViewModel
    @Binding var progressBarValue: Double
    @State var dietType = ["Geleneksel","Vejetaryen","Vegan","Pesketeryan","Ketojenik"]
    @State var dietTypeIcon = ["traditional","vegetarian","vegan","pescatarian","ketogenic"]
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: DietTypeModel.Constants.dietTypeViewTitle)
                Spacer()
                MFAIMultipleSelectionView(selectionList: $dietType, selectionIconList: $dietTypeIcon, selections: $dietVM.dietTypeData.dietType)
                Spacer()
                MFAIButton(buttontitle: DietTypeModel.ButtonTextContext.buttonTextCreate, buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.35
                    dietVM.pageStep = .dietSpecialType
                }
            }
            .navigationBarBackButtonHidden(true)
               .toolbar {
                   ToolbarItem(placement: .topBarLeading) {
                       Button(action: {
                           dietVM.pageStep = .foodAllergy
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
    DietTypeView(dietVM: DietTypeViewModel(), progressBarValue: .constant(0.3))
}
