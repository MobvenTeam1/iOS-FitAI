//
//  GenderView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct GenderView: View {
    @ObservedObject var personelInfoVM: PersonalInfosViewModel
    @State var genderList = ["Erkek","Kadın","Belirtilmeyen"]
    var body: some View {
        ZStack {
            VStack {
                MFAIPersonalInfosHeaderView(title: PersonalInfosModel.Constants.genderViewTitle)
                Spacer(minLength: 50)
                MFAISingleSelectionView(selectionList: $genderList, selection: $personelInfoVM.personalInfoData.gender)
                MFAIButton(buttontitle: "Kaydet") {
                    personelInfoVM.pageStep = .height
                }
            }
        }
    }
}

#Preview {
    GenderView(personelInfoVM: PersonalInfosViewModel())
}
