//
//  SingleSelectionView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAISingleSelectionView: View {
    @Binding var selectionList: [String]
    @Binding var selection: String?
    var body: some View {
        ForEach(selectionList,id: \.self) { title in
            VStack {
                singleRow(title: title)
            }
        }
    }
    
    
    func singleRow(title: String) -> some View {
        HStack {
            Image(systemName: "person.crop.circle.badge.exclam.fill")
                .resizable()
                .frame(width: 50,height: 40)
                .aspectRatio(contentMode: .fit)
                .padding(.leading)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.trailing)
            Spacer(minLength: 20)
            selectionTickChecker(title: title)
                .padding(.trailing)
        }
        .frame(height: 50)
        .onTapGesture {
            print("dokunduk ey halkım")
            selection = title
        }
    }
    
    
    func selectionTickChecker(title: String) -> Image {
        let image: Image
        if selection == title {
           image =  Image(systemName: "checkmark.circle.fill")
        } else {
            image = Image(.ellipse)
                .resizable()
        }
        return image
        
    }
}

#Preview {
    MFAISingleSelectionView(selectionList: .constant(["dd","ss"]), selection: .constant("ss"))
}
