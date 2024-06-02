import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var appState: AppState
    @State private var showSheet: Bool = false
    @State private var goToTrainingAIPage: Bool = false
    @State private var goToNutritionAIPage: Bool = false
    var body: some View {
        NavigationStack {
            ZStack() {
                TabView(selection: $appState.selectedIndex) {
                    HomePageView()
                        .blur(radius: showSheet ? 10 : 0)
                        .tag(0)
                    Text("Second Tab")
                        .tag(1)
                    Text("Third Tab")
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
                            Button {
                                showSheet.toggle()
                            }label: {
                                Image("plustabbar")
                                    .foregroundColor(.black26_27)
                                    .padding()
                                    .background(Color.green177_235)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .padding(.bottom, 80)
                            }
                                .sheet(isPresented: $showSheet) {
                                    AddPlanFromPlusButton(imageName: ["aiassistantrenman","aiassistnutrition","aiassistwater"], firstText: ["Antrenman Planı", "Beslenme Planı", "Su Takibi"], action: [
                                        {
                                            goToTrainingAIPage = true
                                            showSheet = false
                                            appState.isTrainingPlanned = true
                                            appState.isTrainingTapped = true
                                        },
                                        {
                                            goToNutritionAIPage = true
                                            showSheet = false
                                            appState.isNutritionPlanned = true
                                            appState.isNutritionTapped = true
                                        },
                                        {}
                                    ])
                                    .presentationDetents([.large, .medium, .fraction(0.75)])
                                }
                        )
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            NavigationLink(destination: AISupportedTrainingPlan(), isActive: $goToTrainingAIPage) {
                EmptyView()
            }
            NavigationLink(destination: AISupportedNutritionPlan(), isActive: $goToNutritionAIPage) {
                EmptyView()
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(GSMNumber())
        .environmentObject(CheckIfOTPCorrect())
        .environmentObject(AppState())
}
