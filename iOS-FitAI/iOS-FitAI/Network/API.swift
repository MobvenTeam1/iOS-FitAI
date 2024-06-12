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
//        headers["Authorization"] = "Bearer \(AppStorageManager.shared.userToken )"
        headers["Authorization"] = "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ5YXNpbjE3NUBob3RtYWlsLmNvbSIsIklkIjoiMTI3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJBaG1ldCBZYXNpbiBBdGFrYW4iLCJpc19maXJzdF9sb2dpbiI6IkZhbHNlIiwiZXhwIjoxNzE4MjIxNzAzLCJpc3MiOiJGaXRBSUFQSSIsImF1ZCI6IlVzZXIifQ.npCL8EKUnuj1hGR1Ijw-L26_I6nnDC91RvS-kY46GyY"
        
        
        
        headers["Content-Type"] = contentType.rawValue
        return headers
    }
}


