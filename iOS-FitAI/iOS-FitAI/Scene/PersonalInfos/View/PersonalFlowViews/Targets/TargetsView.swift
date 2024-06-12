//
//  TargetsView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 29.05.2024.
//

import SwiftUI

struct TargetsView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @ObservedObject var personalInfoVM: PersonalInfosViewModel
    @Binding var progressBarValue: Double
    @State var targetList = ["Kilo Kaybı","Kilo Alma","Kas Yapma","Sağlıklı Yaşam"]
    @State var targetIconList = ["loseWeight","increase","muscleUp","healthyLife"]
//    

    var body: some View {
        ZStack{
            VStack{
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.targetsViewTitle)
                Spacer()
                MFAIMultipleSelectionView(selectionList: $targetList, selectionIconList: $targetIconList, selections: $personalInfoVM.personalInfoData.goals)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextOK,buttonBackgroundColor: .buttonGreen){
                    progressBarValue += 0.2
                    coordinator.show(.login)
                    //a
                    // TODO: //
//                    Task {
//                     await  personalInfoVM.postPersonalInfo()
//                    }
                    //b
                }
                .padding(30)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        personalInfoVM.pageStep = .birthDate
                    }, label: {
                        Image("back")
                            .resizable()
                            .frame(width: 41, height: 41)
                    })
                }
            }
        }
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return TargetsView(personalInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
        .environmentObject(env)
}
