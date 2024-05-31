//
//  TargetsView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct TargetsView: View {
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State var targetList = ["Kilo Kaybı","Kilo Alma","Kas Yapma","Sağlıklı Yaşam"]
    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetsViewTitle)
                Spacer()
                MFAIMultipleSelectionView(selectionList: $targetList, selections: $personalInfoVM.personalInfoData.targets)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextOK){
                    progressBarValue += 0.2
                }
            }
        }
    }
}

#Preview {
    TargetsView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
