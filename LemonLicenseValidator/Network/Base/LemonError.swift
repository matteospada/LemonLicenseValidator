//
//  LemonError.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 19/12/22.
//

import Foundation

// MARK: Errors
enum LemonError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case itemNotFound
    case requiredFieldMissing
    
    var customMessage: String {
        switch self {
        case .decode:
            return "There was an error decoding the request."
        case .noResponse:
            return "There was no response from the server. It may be temporarily offline."
        case .unexpectedStatusCode:
            return "Something went wrong when fetching the request."
        case .unauthorized:
            return "Your session has expired."
        case .itemNotFound:
            return "An item could not be found."
        case .requiredFieldMissing:
            return "A required field was invalid or missing."
        default:
            return "Unknown error."
        }
    }
}
