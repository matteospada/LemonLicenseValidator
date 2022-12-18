//
//  ActivateModel.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

// MARK: Activate Models
struct ActivateModel: Codable {
    let activated: Bool
    let error: String?
    let licenseKey: LicenseKey?
    let instance: Instance?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case activated, error
        case licenseKey = "license_key"
        case instance, meta
    }
}

// MARK: Validate Models
struct ValidateModel: Codable {
    let valid: Bool
    let error: String?
    let licenseKey: LicenseKey?
    let instance: Instance?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case valid, error
        case licenseKey = "license_key"
        case instance, meta
    }
}

// MARK: Deactivate Models
struct DeactivatedModel: Codable {
    let deactivated: Bool
    let error: String?
    let licenseKey: LicenseKey?
    let instance: Instance?
    let meta: Meta?

    enum CodingKeys: String, CodingKey {
        case deactivated, error
        case licenseKey = "license_key"
        case instance, meta
    }
}

// MARK: - Instance
struct Instance: Codable {
    let id, name, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
    }
}

// MARK: - LicenseKey
struct LicenseKey: Codable {
    let id: Int
    let status, key: String
    let activationLimit, activationUsage: Int
    let createdAt: String?
    let expiresAt: String?
    let testMode: Bool

    enum CodingKeys: String, CodingKey {
        case id, status, key
        case activationLimit = "activation_limit"
        case activationUsage = "activation_usage"
        case createdAt = "created_at"
        case expiresAt = "expires_at"
        case testMode = "test_mode"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let storeID, orderID, orderItemID, productID: Int

    enum CodingKeys: String, CodingKey {
        case storeID = "store_id"
        case orderID = "order_id"
        case orderItemID = "order_item_id"
        case productID = "product_id"
    }
}
