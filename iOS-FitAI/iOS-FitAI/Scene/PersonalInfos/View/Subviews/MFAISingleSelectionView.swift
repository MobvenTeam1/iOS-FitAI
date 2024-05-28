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
                .font(.title3)
                .fontWeight(.bold)
                .padding(.trailing)
                
            Spacer(minLength: 20)
            selectionTickChecker(title: title)
                .padding(.trailing)
                .frame(width: 40, height: 30)
        }
        .frame(height: 50)
        .onTapGesture {
            DispatchQueue.main.async {
                self.selection = title

            }
        }
    }
    
    
    func selectionTickChecker(title: String) -> Image {
        let image: Image
        if selection == title {
           image =  Image(systemName: "checkmark.circle.fill")
                .resizable()
        } else {
            image = Image(.ellipse)
                .resizable()
        }
        return image
        
    }
}

#Preview {
    MFAISingleSelectionView(selectionList: .constant(["ddddd","ssssss"]), selection: .constant("ss"))
}
