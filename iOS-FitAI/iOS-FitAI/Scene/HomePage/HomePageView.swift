//
//  HomePageView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 28.05.2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var isTrainingPlanned: Bool = false
    @State private var isNutritionPlanned: Bool = false
    @State private var isNutritionTapped: Bool = false
    @State private var isTrainingTapped: Bool = false
    @State private var goToTrainingAIPage: Bool = false
    @State private var goToNutritionAIPage: Bool = false
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
                        VStack(spacing: 0) {
                            CalendarView()
                            DailyTargetView()
                            VStack(spacing: -12) {
                                if !isTrainingPlanned {
                                    PersonalizedPlanButton(imageName: "dumbell",text: "Kişiselleştirilmiş Antrenman\nPlanını Oluştur ") {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            isTrainingPlanned = true
                                        }
                                        goToTrainingAIPage = true
                                    }
                                    //
                                } else {
                                    TrainingPlannedSubView(isTrainingTapped: $isTrainingTapped,
                                                           typeOfExercise: "Pilates",
                                                           duration: "15 dakika",
                                                           calories: "150 kcal")
                                }
                                if !isNutritionPlanned {
                                    PersonalizedPlanButton(imageName: "beslenme", text: "Kişiselleştirilmiş Beslenme\nPlanını Oluştur ") {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            isNutritionPlanned = true
                                        }
                                        goToNutritionAIPage = true
                                    }
                                } else {
                                    NutritionPlanningSubView(isNutritionTapped: $isNutritionTapped,
                                                             typeOfMeal: "Kahvaltı",
                                                             duration: "15 dakika",
                                                             calories: "515 kcal")
                                }
                                
                            }
                            TrainingCategoriesView(imageName: ["pilates", "fitness", "HIIT", "HIIT"])
                            MealCategories(imageName: ["kahvaltı", "kahvaltı", "kahvaltı", "kahvaltı"],
                                           actions: [
                                            { print("Kahvaltı tıklandı")},
                                            { print("Kahvaltı tıklandı2")},
                                            { print("Kahvaltı tıklandı3")},
                                            { print("Kahvaltı tıklandı4")}
                                           ])
                        }
                    }
                    NavigationLink(destination: AISupportedTrainingPlan(), isActive: $goToTrainingAIPage) {
                        EmptyView()
                    }
                    NavigationLink(destination: AISupportedNutritionPlan(), isActive: $goToNutritionAIPage) {
                        EmptyView()
                    }
                }
                .padding(.bottom, 123)
            }
            .toolbar(.hidden)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HomePageView()
}
