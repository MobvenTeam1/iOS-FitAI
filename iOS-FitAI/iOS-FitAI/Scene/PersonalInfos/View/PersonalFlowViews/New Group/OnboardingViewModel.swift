//
//  OnboardingViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 31.05.2024.
//
import SwiftUI
import Foundation

class OnboardingViewModel: ObservableObject{
    @Published var pageStep: OnboardingModel.OnboardingFlow = .personalTarget
}
