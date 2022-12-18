//
//  HTTPClient.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

// MARK: HTTPClient
protocol HTTPClient {
    func fetchData<T: Decodable>(endpoint: any Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    func fetchData<T: Decodable>(endpoint: any Endpoint, responseModel: T.Type) async throws -> T {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            throw RequestError.invalidURL
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        request.timeoutInterval = 5
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        
        print(String(data: data, encoding: .utf8))
        
        switch response.statusCode {
        case 200...299:
            guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                throw RequestError.decode
            }
            return decodedResponse
        case 401:
            throw RequestError.unauthorized
        default:
            throw RequestError.unexpectedStatusCode
        }
    }
}
