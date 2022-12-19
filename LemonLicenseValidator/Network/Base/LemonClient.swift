//
//  HTTPClient.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

// MARK: HTTPClient
protocol LemonClient {
    func fetchData<T: Decodable>(endpoint: any LemonEndpoint, responseModel: T.Type) async throws -> T
}

extension LemonClient {
    func fetchData<T: Decodable>(endpoint: any LemonEndpoint, responseModel: T.Type) async throws -> T {
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
                throw LemonError.decode
            }
            return decodedResponse
        case 401:
            throw LemonError.unauthorized
        case 404:
            throw LemonError.itemNotFound
        case 422:
            throw LemonError.requiredFieldMissing
        default:
            throw LemonError.unexpectedStatusCode
        }
    }
}
