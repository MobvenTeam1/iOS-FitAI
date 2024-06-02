import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack() {
            TabView(selection: $appState.selectedIndex) {
                HomePageView()
                    .tag(0)
                ForgotMyPasswordWithEmail()
                    .tag(1)
                HomePageView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            VStack {
                Spacer()
                CustomTabBarView(selectedIndex: $appState.selectedIndex)
                    .background(Color.white)
                    .clipShape(TabBarShape())
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                    .overlay(
                        Button(action: {
                        }) {
                            Image("plustabbar")
                                .foregroundColor(.black26_27)
                                .padding()
                                .background(Color.green177_235)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .offset(y: -40)
                        }
                    )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
#Preview {
    TabBarView()
        .environmentObject(GSMNumber())
        .environmentObject(CheckIfOTPCorrect())
        .environmentObject(AppState())
}
