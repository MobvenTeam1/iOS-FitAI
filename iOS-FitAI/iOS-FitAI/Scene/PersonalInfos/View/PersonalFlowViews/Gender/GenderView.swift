//
//  GenderView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct GenderView: View {
    @ObservedObject var personelInfoVM: PersonalInfosViewModel
    @State var genderList = ["Kadın","Erkek","Belirtmek istemiyorum"]
    @State var genderIconList = ["female","male","gender"]
    @Binding var progressBarValue: Double
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    var body: some View {
            ZStack {
                VStack {
                                    Button {
                                        coordinator.show(.register)
                                    }label: {
                                        Image("back")
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.genderViewTitle)
                    Spacer(minLength: 50)
                    MFAISingleSelectionView(selectionList: $genderList, selectionIconList: $genderIconList, selection: $personelInfoVM.personalInfoData.gender)
                        .padding()
                    MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen) {
                        progressBarValue += 0.16
                        personelInfoVM.pageStep = .height
                    }
                    .padding(.bottom, 30)
                }
                //            .navigationBarBackButtonHidden(true)
               
            }
        
    }
}

#Preview {
    GenderView(personelInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
