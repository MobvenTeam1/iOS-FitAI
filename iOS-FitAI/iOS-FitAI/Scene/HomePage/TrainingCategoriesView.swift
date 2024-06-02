//
//  TrainingCategoriesView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 29.05.2024.
//

import SwiftUI

struct TrainingCategoriesView: View {
    let imageName: [String]
    var body: some View {
        VStack(spacing: 12) {
            HStack {
            Text("Antrenman Kategorileri")
                .font(.urbanistBold(size: 18))
                .foregroundStyle(Color.black29_30)
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    
                }label: {
                    Text("Tümünü Gör")
                        .font(.urbanistSemibold(size: 14))
                        .foregroundStyle(Color.gray150_150)
                        .padding(.trailing, 24)
                }
        }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<imageName.count, id:\.self) { image in
                        Image(imageName[image])
                    }
                }
            }
        }
        .padding(.top, 24)
        .padding(.leading, 24)
    }
}

#Preview {
    HomePageView()
}
