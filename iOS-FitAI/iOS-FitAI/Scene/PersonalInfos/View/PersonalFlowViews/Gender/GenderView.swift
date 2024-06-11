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
                    progressBarValue += 0.2
                    personelInfoVM.pageStep = .height
                }   
                .padding(.bottom, 30)
                .padding(.top, 28)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
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
    GenderView(personelInfoVM: PersonalInfosViewModel(), progressBarValue: .constant(0.2))
}
