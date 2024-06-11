//
//  CountdownTimerView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 23.05.2024.
//

import SwiftUI
struct CountdownTimerView: View {
    @State private var timeRemaining = 20
    @State private var timerActive = false
    @State private var timer: Timer?
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            if timerActive {
                Text("00: \(timeRemaining)")
                    .font(.urbanistRegular(size: 16))
                    .foregroundStyle(Color.black84_84)
                    .padding()
            } else {
                Button {
                    startTimer()
                    appState.isOTPCorrect = nil
                }label: {
                    VStack(spacing: 4) {
                        if timeRemaining == 0 {
                            if appState.isOTPCorrect == false {
                                Text("")
                            }
                            else {
                                Text("Kod almadınız mı?")
                                    .font(.urbanistRegular(size: 15))
                                    .foregroundStyle(Color.black84_84)
                                    .padding(.top, 24)
                                Text("Tekrar gönder")
                                    .font(.urbanistBold(size: 15))
                                    .foregroundStyle(Color.black84_84)
                            }
                        }
                        if appState.isOTPCorrect == false {
                            Text("Yanlış kod, lütfen tekrar deneyin")
                                .foregroundStyle(Color.red235_67)
                                .font(.urbanistRegular(size: 15))
                                .padding(.top, 24)
                            Text("**Tekrar kod gönder**")
                                .foregroundStyle(Color.black84_84)
                                .font(.urbanistBold(size: 15))
                        }
                    }
                }
            }
        }
        .onAppear {
            startTimer()
        }
        .onChange(of: appState.isOTPCorrect) { newValue in
            if newValue == false { // false olduğu anda çağırır.
                stopTimerAndReset()
            }
        }
    }
    
    func startTimer() {
        timerActive = true
        timeRemaining = 3
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                stopTimerAndReset()
            }
        }
    }
    func stopTimerAndReset() {
        timerActive = false
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    OTPNumber()
        .environmentObject(AppState())
}
