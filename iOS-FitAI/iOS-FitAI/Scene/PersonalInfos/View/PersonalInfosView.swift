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
                
                if viewmodel.pageStep == .gender {
                    GenderView(personelInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }
                else if viewmodel.pageStep == .height{
                    HeightView(personalInfoVM: viewmodel, progressBarValue: $progressBarValue)
                }
                
            }
        }
    }
}

#Preview {
    PersonalInfosView()
}
