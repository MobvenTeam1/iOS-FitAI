//
//  String+Extension.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 7.06.2024.
//

import Foundation

extension String? {
    var toEmpty: String {
        if let self {
            return self
        }
        return ""
    }
}
