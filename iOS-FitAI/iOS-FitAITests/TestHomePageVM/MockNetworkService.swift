//
//  MockNetworkService.swift
//  iOS-FitAITests
//
//  Created by Ahmet Yasin Atakan on 22.06.2024.
//

import Foundation
@testable 
import iOS_FitAI

class MockNetworkService: Networkable {
    var response: Result<TrainingModel, Error>?
    
    func request() async -> URLRequest {
        return URLRequest(url: URL(string: "https://mobven123.com")!)
    }
    
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, Error> {
        guard let response = response as? Result<T, Error> else {
            fatalError("Response error")
        }
        return response
    }
}
