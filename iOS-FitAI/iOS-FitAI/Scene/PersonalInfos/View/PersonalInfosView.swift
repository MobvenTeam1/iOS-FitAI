//
//  PersonalInfos.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI



struct PersonalInfosView: View {
    @StateObject var viewmodel = PersonalInfosViewModel()
    @State var progressBarValue: Double = 0.0
    
    var body: some View {
            ZStack {
                VStack{
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
//                        switch PersonalInfosModel.PersonalInfosFlow {
////                        case .height:
////                            viewmodel.pageStep = .gender
//                        case .currentWeight:
//                            viewmodel.pageStep = .height
//                        }
                        
    //                    personelInfoVM.pageStep = .welcome
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

#Preview {
    PersonalInfosView()
}
