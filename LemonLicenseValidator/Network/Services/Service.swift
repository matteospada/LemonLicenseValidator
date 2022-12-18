//
//  Service.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

import Foundation

// MARK: Service -> to implement

protocol manageLicense {
    func activate(licenseKey: String, instanceName: String) async throws -> ActivateModel
    func validate(licenseKey: String, instanceId: String) async throws -> ValidateModel
    func deactivate(licenseKey: String, instanceId: String) async throws -> DeactivatedModel
}

struct LemonSqueezyService: HTTPClient, manageLicense {
    func activate(licenseKey: String, instanceName: String) async throws -> ActivateModel {
        let body = ["license_key": licenseKey, "instance_name": instanceName]
        let res = try await fetchData(endpoint: LemonSqueezyEndpoints.activate(body), responseModel: ActivateModel.self)
        return res
    }
    
    func validate(licenseKey: String, instanceId: String) async throws -> ValidateModel {
        let body = ["license_key": licenseKey, "instance_id": instanceId]
        let res = try await fetchData(endpoint: LemonSqueezyEndpoints.validate(body), responseModel: ValidateModel.self)
        return res
    }
    
    func deactivate(licenseKey: String, instanceId: String) async throws -> DeactivatedModel {
        let body = ["license_key": licenseKey, "instance_id": instanceId]
        let res = try await fetchData(endpoint: LemonSqueezyEndpoints.deactivate(body), responseModel: DeactivatedModel.self)
        return res
    }
}
