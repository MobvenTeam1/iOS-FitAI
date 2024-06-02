//
//  HelloView.swift
//  
//
//  Created by Ahmet Yasin Atakan on 26.05.2024.
//

import SwiftUI

struct HelloView: View {
    @State private var currentDate: String = ""
    @EnvironmentObject var checkIfUserLogined: AppState
    let userName: String
    var body: some View {
            ZStack(alignment: .top) {
                Color.black.opacity(0.9)
                HStack() {
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Merhaba \(userName),")
                            .font(.urbanistBold(size: 24))
                        Text(currentDate)
                            .font(.urbanistRegular(size: 14))
                            .onAppear {
                                self.currentDate = getCurrentDate()
                            }
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button {
                        checkIfUserLogined.selectedIndex = 3
                    }label: {
                        Image("notification")
                    }
                    Image("profileimage")
                }
                .padding(.top, 60)
                .padding(.horizontal, 22)
                
            }
    }
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "tr_TR") // Türkçe tarih formatı
        return formatter.string(from: date)
    }
}

#Preview {
    HelloView(userName: "Simge")
}
