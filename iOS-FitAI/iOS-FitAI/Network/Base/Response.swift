//
//  Response.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public var results: T?
}
