//
//  HomePageView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 28.05.2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var goToTrainingAIPage: Bool = false
    @State private var goToNutritionAIPage: Bool = false
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HelloView(userName: "Simge")
                        .frame(height: 187)
                    ZStack(alignment: .center) {
                        Color.white
                            .ignoresSafeArea()
                            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30)))
                            .offset(y: -40)
                        VStack {
                            CalendarView()
                            DailyTargetView()
                            AIPlanButtons(goToTrainingAIPage: $goToTrainingAIPage, goToNutritionAIPage: $goToNutritionAIPage)
                            TrainingCategoriesView(imageName: ["pilates", "fitness", "HIIT"])
                            MealCategories(imageName: ["kahvaltı", "kahvaltı"],
                                           actions: [
                                            { print("Kahvaltı tıklandı")},
                                            { print("Kahvaltı tıklandı2")}
                                           ])
                        }
                    }
                    NavigationLinks(goToTrainingAIPage: $goToTrainingAIPage,
                                    goToNutritionAIPage: $goToNutritionAIPage)
                }
                .padding(.bottom, 123)
            }
            .toolbar(.hidden)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(AppState())
}
