//
//  Bundle+Extension.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation
public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
