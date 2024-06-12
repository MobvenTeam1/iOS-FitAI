//
//  PersonalInfos.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI



struct PersonalInfosView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    @StateObject var viewmodel = PersonalInfosViewModel()
    @State var progressBarValue: Double = 0.0
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    if viewmodel.pageStep != .gender {
                        Button {
                            let index = viewmodel.pageStep.rawValue
                            if index > 0 {
                                viewmodel.pageStep = PersonalInfosModel.PersonalInfosFlow(rawValue: index-1) ?? .gender
                            }
                            
                        }
                    label: {
                        Image("back")
                            .resizable()
                            .frame(width: 41, height: 41)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                    
                    Button {}
                label: {
                    Image("Onboarding-5-Icon")
                        .resizable()
                        .frame(width: 41, height: 41)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
                ProgressView(value: progressBarValue)
                    .progressViewStyle(CustomProgressViewStyle(trackColor: .gray, progressColor: .buttonGreen))
                    .padding()
                
                if viewmodel.pageStep == .gender{
                    GenderView(personelInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .height{
                    HeightView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .currentWeight{
                    CurrentWeightView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .targetWeight{
                    TargetWeightView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .birthDate{
                    BirthdayView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }else if viewmodel.pageStep == .targets{
                    TargetsView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                } else {
                    Text("There is nothing")
                }
            }
        }
        .onChange(of: viewmodel.isPersonalInfoFlowFinished) { changed in
            if changed {
                coordinator.show(.homePage)
            }
        }
    }
}

#Preview {
    PersonalInfosView()
}
