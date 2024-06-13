//
//  TrainingPlannedView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct TrainingPlannedView: View {
    @StateObject var homePageVM = HomePageViewModel()
    
    var body: some View {
        VStack {
            Text("Setler")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black26_27)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 52)
            if let trainingProgram = homePageVM.trainingProgram {
                ForEach(trainingProgram.keys.sorted(), id: \.self) { key in
                    if let value = trainingProgram[key] {
                        ZStack {
                            Color.white
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 1, y: 1)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(key)
                                        .font(.urbanistBold(size: 16))
                                        .foregroundColor(Color.black11_11)
                                    Text(value)
                                        .font(.urbanistRegular(size: 14))
                                        .foregroundColor(Color.black102_102)
                                }
                                .padding(.vertical, 4)
                                Spacer()
                                Image("setlerimage")
                            }
                            .padding(.horizontal)
                        }
                        .frame(width: 287, height: 74)
                    }
                }
            } else {
                Text("Veri yok")
                    .font(.urbanistRegular(size: 14))
                    .foregroundColor(Color.gray)
            }
        }
        .padding()
        // TODO: move this .task to homepageview after show it tuesday
        .task {
            await homePageVM.getTraining()
        }
    }
}
#Preview {
    TrainingPlannedView()
}
