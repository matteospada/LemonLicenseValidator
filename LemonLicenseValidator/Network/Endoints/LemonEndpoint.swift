//
//  Endpoints.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

// MARK: Endpoint
protocol LemonEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}
