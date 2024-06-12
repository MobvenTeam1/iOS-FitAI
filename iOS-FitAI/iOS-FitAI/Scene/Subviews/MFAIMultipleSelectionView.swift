//
//  MFAIMultipleSelectionView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 24.05.2024.
//

import SwiftUI

struct MFAIMultipleSelectionView: View {
    @Binding var selectionList: [String]
    @Binding var selectionIconList: [String]
    @Binding var selections: [String]?
    
    var body: some View {
        ForEach(Array(zip(selectionList, selectionIconList)),id: \.0) { title, iconSelected in
            VStack {
                singleRow(title: title, iconSelected: iconSelected)
            }
        }
    }
        func singleRow(title: String, iconSelected: String) -> some View {
            HStack {
                Image(iconSelected)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding(.trailing)
                Spacer(minLength: 20)
                selectionTickChecker(title: title)
                    .padding(.trailing)
                    .frame(width: 17, height: 17)
                
                if selections == [title]{
                    border(.buttonGreen)
                }
            }
            .frame(width: 327, height: 56)
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
                    image =  Image(.check)
                        .resizable()
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
    MFAIMultipleSelectionView(selectionList: .constant(["aaaa","bbbb"]), selectionIconList: .constant(["aaaa","bbbb"]), selections: .constant(["cccc","ddddd"]))
}
