//
//  PersonalInfos.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct PersonalInfosView: View {
    @StateObject var viewmodel = PersonalInfosViewModel()
    
    
    var body: some View {
        ZStack {
            if viewmodel.pageStep == .gender {
                GenderView(personelInfoVM: viewmodel)
            }
            
        }
    }
}

#Preview {
    PersonalInfosView()
}
