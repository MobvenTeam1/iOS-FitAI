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
    @State var targetIconList = ["loseWeight","increase","muscleUp","healthyLife"]
//    

    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetsViewTitle)
                    .padding(.bottom, 300)
                MFAISingleSelectionView(selectionList: $targetList, selectionIconList: $targetIconList, selection: $personalInfoVM.personalInfoData.goals)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextOK,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.2
                    Task {
                        await personalInfoVM.getPersonalInfoRequest()
                    }
                }
                .padding(30)
            }
            .onAppear(perform: {
                progressBarValue = 1.0
                
            })

        }
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return TargetsView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
        .environmentObject(env)
}
