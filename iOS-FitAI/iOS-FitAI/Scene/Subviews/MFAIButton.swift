//
//  MFAIButton.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//

import SwiftUI

struct MFAIButton: View {
    init(buttontitle: String,
         buttonFrontImage: Image? = nil,
         buttonBackImage: Image? = nil,
         buttonBackgroundColor: Color = .blue,
         action: (() -> ())? = nil) {
        self.buttontitle = buttontitle
        self.buttonFrontImage = buttonFrontImage
        self.buttonBackImage = buttonBackImage
        self.buttonBackgroundColor = buttonBackgroundColor
        self.action = action
    }
    
    let buttontitle: String
    let buttonFrontImage: Image?
    let buttonBackImage: Image?
    let buttonBackgroundColor: Color
    let action: (() -> ())?
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            
            HStack {
                if let buttonFrontImage {
                    buttonFrontImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 40)
                }
                Text(buttontitle)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .fontWeight(.medium)
                    
                if let buttonBackImage {
                    buttonBackImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 40)
                        
                }
            }
            .padding(.horizontal)
          
        })
        .border(.clear, width: 2)
        .background{
            buttonBackgroundColor
                .frame(width: 327, height: 60)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
       
    }
}

#Preview {
    MFAIButton(buttontitle: "title",buttonBackgroundColor: .buttonGreen )
}
