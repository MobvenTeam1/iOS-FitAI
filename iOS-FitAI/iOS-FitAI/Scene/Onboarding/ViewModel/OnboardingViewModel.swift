//
//  OnboardingViewModel.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 10.06.2024.
//
import SwiftUI
import Foundation

class OnboardingViewModel: ObservableObject{
    @Published var pageStep: OnboardingModel.OnboardingFlow = .personalTarget
}
