//
//  AppStorageManager.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 6.06.2024.
//

import Foundation
import SwiftUI

class AppStorageManager: ObservableObject {
    @AppStorage("userToken") var userToken: String = ""
    
    static let shared = AppStorageManager()
}
