//
//  Date+Extension.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 13.06.2024.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
