//
//  API.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation

public enum API {
    static func prepareUrl(withPath path: String) -> URL {
        guard let baseURL = Bundle.main.infoForKey("BASE_URL") else {
            fatalError("Could not create BaseURL")
        }

        guard let url = URL(string: "\(baseURL)\(path)") else {
            fatalError("Could not create url")
        }

        return url
    }

    static func getHeader(contentType: ContentType) -> [String: String] {
        var headers: [String: String] = [:]
        headers["Authorization"] = "Bearer \(AppStorageManager.shared.userToken ?? "")"
//        headers["Authorization"] = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ5YXNpbjJAaG90bWFpbC5jb20iLCJJZCI6IjExMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiICIsImlzX2ZpcnN0X2xvZ2luIjoiVHJ1ZSIsImV4cCI6MTcxODE0OTU5OSwiaXNzIjoiRml0QUlBUEkiLCJhdWQiOiJVc2VyIn0.MeKn4JOJUwr-sVEFp6IjCnCUBsfReZs-LTw0bXch7sM"
        headers["Content-Type"] = contentType.rawValue
        return headers
    }
}


