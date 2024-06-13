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
    @Binding var selection: String
    
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
                .frame(width:13.33, height: 20)
                .aspectRatio(contentMode: .fit)
                .padding(.leading)
            Text(title)
                .font(.urbanistBlack(size: 15))
                .padding(.trailing)
            Spacer(minLength: 20)
            
            Image(selection == title ? .selectedGreenCheck : .nonSelectedCheck)
                .resizable()
                .frame(width: 20,height: 20)
                .foregroundStyle(.buttonGreen)
                .padding(.trailing)
            
        }
        .onTapGesture {
            print("onTapGesture triggered")
            if selection != title {
                print("onTapGesture if")
               selection = title
            }
        }
        .frame(height: 56)
        .border(selection == title ? .buttonGreen : .clear)
        .padding(.horizontal)
    }
}

#Preview {
    MFAISingleSelectionView(selectionList: .constant(["ddddd","ssssss"]), selectionIconList: .constant(["fitaiimage","ddddd"]), selection: .constant("ss"))
}
