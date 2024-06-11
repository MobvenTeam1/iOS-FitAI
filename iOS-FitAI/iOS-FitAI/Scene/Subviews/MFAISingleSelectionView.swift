//
//  SingleSelectionView.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAISingleSelectionView: View {
    @Binding var selectionList: [String]
    @Binding var selectionIconList: [String]
    @Binding var selection: String?
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
                .frame(width:20,height: 20)
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
            
            if selection == title{
                border(.buttonGreen)
            }
        }
        .frame(width: 327, height: 56)
       
       
        .onTapGesture {
            DispatchQueue.main.async {
                self.selection = title

            }
        }
    }
    
    
    func selectionTickChecker(title: String) ->  Image {
        let image: Image
        if let selection{
            if selection.contains(title){
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
    MFAISingleSelectionView(selectionList: .constant(["ddddd","ssssss"]), selectionIconList: .constant(["ddddd","ddddd"]), selection: .constant("ss"))
}
