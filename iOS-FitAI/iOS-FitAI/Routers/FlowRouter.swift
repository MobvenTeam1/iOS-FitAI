//
//  FlowRouter.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 23.05.2024.
//
import SwiftUI
import UIKit

public enum FlowRouter: NavigationRouter {

    case splash
    case register
    case onboarding
    case personalInfos
    case login
    case handleScreens
    case homePage
    case tabBar
    case dietTypeflow
    case exerciseProgramView
    
    public var transition: NavigationTransitionStyle {
        switch self {
        default:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .splash:
            SplashView()
        case .onboarding:
            OnboardingView()
        case .register:
            RegisterView()
        case .personalInfos:
            PersonalInfosView()
        case .login:
            LoginView()
        case .handleScreens:
            HandleScreens()
        case .homePage:
            HomePageView()
        case .tabBar:
            TabBarView()
        case .dietTypeflow:
            DietTypeflow()
        case .exerciseProgramView:
            ExerciseProgramView()
        default:
            Text(verbatim: "There is nothing")
                .foregroundStyle(.blue)
        }
    }
}
