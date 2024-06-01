//
//  MFAIMultipleSelectionView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 24.05.2024.
//

import SwiftUI

struct MFAIMultipleSelectionView: View {
    @Binding var selectionList: [String]
    @Binding var selections: [String]?
    
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
                print("pressed")
                if let selections{
                    if selections.contains(title){
                        let index = selections.firstIndex(of: title)
                        self.selections?.remove(at: index ?? 0)
                    }else{
                        self.selections?.append(title)
                    }
                }
                
            }
        }
        func selectionTickChecker(title: String) -> Image {
            let image: Image
            if let selections{
                if selections.contains(title){
                    image =  Image(systemName: "checkmark.circle.fill")
                }else {
                    image = Image(.ellipse)
                        .resizable()
                }
            }else {
                image = Image(.ellipse)
                    .resizable()
            }
            return image
        }
}


#Preview {
    MFAIMultipleSelectionView(selectionList: .constant(["aaaa","bbbb"]), selections: .constant(["cccc","ddddd"]))
}
