//
//  OTPTextField.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI
struct OTPTextField: View {
    let numberOfFields: Int
    @State var enterValue: [String]
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""
    @EnvironmentObject var isOTPCorrect: CheckIfOTPCorrect
    @State private var navigateToNextScreen = false
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
            HStack(spacing: 16) {
                ForEach(0..<numberOfFields, id: \.self) { index in
                    TextField("", text: $enterValue[index], onEditingChanged: { editing in
                        if editing {
                            oldValue = enterValue[index]
                        }
                    })
                    .keyboardType(.numberPad)
                    .frame(width: 69.15, height: 60)
                    .background(Color.white247_248)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isOTPCorrect.isOTPCorrect == false ? Color.red : Color.gray232_232)
                    )
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                                checkOTP()
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        }
                    }
                }
            }
        }
            NavigationLink(destination: CreateNewPassword(), isActive: $navigateToNextScreen) {
                EmptyView()
            }
        }
    }
    
    func checkOTP() {
        let otp = enterValue.joined()
        if otp == "1111" {
            isOTPCorrect.isOTPCorrect = true
            navigateToNextScreen = true
        } else {
            isOTPCorrect.isOTPCorrect = false
        }
    }
}


//#Preview {
//    OTPTextField(numberOfFields: 4)
//}
