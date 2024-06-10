//
//  Network.swift
//  iOS-FitAI
//
//  Created by Elif Tum on 10.06.2024.
//


import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable, P: Encodable>(with requestType: RequestType, parameters: P? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {

        guard let url = requestType.endPoint else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        print(url)
        request.httpMethod = requestType.httpMethod.rawValue

        if request.httpMethod == HttpMethod.POST.rawValue {
            if let parameters = parameters {
                if let jsonData = try? JSONEncoder().encode(parameters) {
                    request.httpBody = jsonData
                    print(jsonData.prettyPrintedJSONString)
                }
                request.allHTTPHeaderFields = API.getHeader(contentType: ContentType.json)
            }
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("Data:", data?.prettyPrintedJSONString)
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}



