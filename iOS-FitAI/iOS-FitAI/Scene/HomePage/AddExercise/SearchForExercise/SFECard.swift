//
//  SFECard.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 5.06.2024.
//

import SwiftUI

struct SFECard: View {
    let exercise: Exercise
    @State private var isButtonTapped: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
                .frame(width: 327, height: 82)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 1, y: 1)
            HStack {
                ZStack {
                    Color.white247_248
                        .frame(width: 40, height: 50)
                        .cornerRadius(8)
                    Image(exercise.imageName)
                }
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .font(.urbanistBold(size: 16))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(exercise.secondaryText)
                        .font(.urbanistRegular(size: 14))
                        .foregroundColor(Color.black102_102)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Button {
                    isButtonTapped = true
                }label: {
                    ZStack {
                        Circle()
                            .frame(width: 34, height: 34)
                            .foregroundStyle(Color.white247_248)
                        Image("plustabbar")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    .sheet(isPresented: $isButtonTapped, content: {
                        DurationForExercise()
                            .presentationDetents([.large, .fraction(0.4)])
                    })
                }
            }
            .padding(.horizontal, 24)
        }
    }
}


//#Preview {
//    DurationForExercise()
//}
