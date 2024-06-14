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
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.genderViewTitle)
                Spacer(minLength: 50)
                MFAISingleSelectionView(selectionList: $genderList,
                                        selectionIconList: $genderIconList, selection: $personelInfoVM.personalInfoData.gender.toUnwrapped(defaultValue: ""))
                .padding(.bottom, 8)
                MFAIButton(buttontitle: PersonalInfosModel.ButtonTextContext.buttonTextNext,
                           buttonBackgroundColor: .buttonGreen) {
                    personelInfoVM.pageStep = .height
                }
                           .padding(30)
            }
            .onAppear(perform: {
                progressBarValue = 0.0
            })
        }
    }
}

#Preview {
    @StateObject var vm = PersonalInfosViewModel()
    return GenderView(personelInfoVM: vm, progressBarValue: .constant(0.0))
}
