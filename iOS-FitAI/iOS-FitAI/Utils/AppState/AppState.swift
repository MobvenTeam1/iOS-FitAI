//
//  AppState.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isLoginSuccessful: Bool = false
    @Published var selectedIndex: Int = 0
}
