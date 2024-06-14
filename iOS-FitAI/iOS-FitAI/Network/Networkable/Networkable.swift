//
//  Networkable.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 5.06.2024.
//

import Foundation
public protocol Networkable {
    func request() async -> URLRequest
}

public extension Networkable {
    func fetch<T: Decodable>(requestModel model: T.Type) async -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request(), delegate: nil)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(NSError.generic)
            }
            
            switch response.statusCode {
                
                //            case 400:
                //                let apiError = try JSONDecoder().decode(APIError.self, from: data)
                //                return .failure(apiError)
                //
                //            case 500:
                //                let apiError = try JSONDecoder().decode(APIError.self, from: data)
                //                return .failure(apiError)
                
                
            case 401:
                return .failure(NSError.generic)
                
            default:
                if let json = try? JSONSerialization.jsonObject(with: data, options:  .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print("---------------------------------")
                    print("---------------------------------")
                    print(String(decoding: jsonData, as: UTF8.self))
                    print("---------------------------------")
                    print("---------------------------------")
                }
                
                
                
                if model.self is Data.Type {
                    return .success(data as! T)
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                do {
                    let decodedData =  try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedData)
                } catch {
                    print("Decoding error: ", error.localizedDescription)
                    print("Decoding error: ", error)
                    return .failure(NSError.generic)
                }
            }
            
        } catch {
            print("Error: ", error.localizedDescription)
            print("Error: ", error)
            return .failure(NSError.generic)
        }
    }

}
