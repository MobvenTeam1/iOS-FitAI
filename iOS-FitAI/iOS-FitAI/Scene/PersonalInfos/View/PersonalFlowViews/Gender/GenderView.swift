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
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.genderViewTitle)
                Spacer(minLength: 50)
                MFAISingleSelectionView(selectionList: $genderList, selectionIconList: $genderIconList, selection: $personelInfoVM.personalInfoData.gender)
                    .padding(.bottom, 8)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext, buttonBackgroundColor: .buttonGreen) {
                    
                    personelInfoVM.pageStep = .height
                }   
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .onAppear(perform: {
                progressBarValue = 0.0
                
            })
        }
    }
}

#Preview {
    GenderView(personelInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
