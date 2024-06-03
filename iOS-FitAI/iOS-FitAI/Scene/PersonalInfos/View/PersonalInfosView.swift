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
                                    
                if viewmodel.pageStep == .welcome {
                    WelcomeView(personalInfoVM: viewmodel)
                }else if viewmodel.pageStep == .gender{
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
    }
}

#Preview {
    PersonalInfosView()
}
