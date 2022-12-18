//
//  LemonSqueezyEndpoints.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

enum LemonSqueezyEndpoints {
    case activate([String: Any]?)
    case validate([String: Any]?)
    case deactivate([String: Any]?)
}

extension LemonSqueezyEndpoints: Endpoint {
    
    var baseURL: String {
        return "https://api.lemonsqueezy.com"
    }
    
    var path: String {
        switch self {
        case .activate:
            return "/v1/licenses/activate"
        case .validate:
            return "/v1/licenses/validate"
        case .deactivate:
            return "/v1/licenses/deactivate"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .activate, .validate, .deactivate:
            return .post
        }
    }
    
    var header: [String: String]? {
        switch self {
        case .activate, .validate, .deactivate:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case let .activate(body):
            return body
        case let .validate(body):
            return body
        case let .deactivate(body):
            return body
        }
    }
}
