//
//  AppStorageManager.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import SwiftUI

class AppStorageManager: ObservableObject {
    static let shared = AppStorageManager()
    @AppStorage("userToken") var userToken: String?
       
       private init() {}
}
