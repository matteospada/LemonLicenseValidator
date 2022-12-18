//
//  ContentViewViewModel.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    @Published var license = ""
    @Published var validationInfo = ""
    let gumroad = NSRegularExpression("^[0-9a-fA-F]{8}-[0-9a-fA-F]{8}-[0-9a-fA-F]{8}-[0-9a-fA-F]{8}$")
    let lemon = NSRegularExpression("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")
    
    let lemonClient = LemonSqueezyService()
    
    func validate() {
        let type = gumroad.matches(license) ? LicenseType.gumroad : lemon.matches(license) ? LicenseType.lemon  : LicenseType.invalid
        
        switch type {
        case .gumroad:
            self.validationInfo = "Gumroad License"
        case .lemon:
            Task {
                do {
                    //I'm not sure about what I have to add for the istance name.
                    let res = try await lemonClient.validate(licenseKey: LocalState.license, instanceId: LocalState.instanceId)
                    print(res)
                } catch {
                    print(error)
                }
            }
        case .invalid:
            self.validationInfo = "Invalid License"
        }
        
    }
    
    func activate() {
        let type = gumroad.matches(license) ? LicenseType.gumroad : lemon.matches(license) ? LicenseType.lemon  : LicenseType.invalid
        
        switch type {
        case .gumroad:
            self.validationInfo = "Gumroad License"
        case .lemon:
            Task {
                do {
                    //I'm not sure about what I have to add for the istance name.
                    let res = try await lemonClient.activate(licenseKey: license, instanceName: "Test")
                    if res.activated {
                        guard let instanceId = res.instance?.id else { return }
                        LocalState.instanceId = instanceId
                        LocalState.license = license
                    }
                } catch {
                    print(error)
                }
            }
        case .invalid:
            self.validationInfo = "Invalid License"
        }
    }
    
    func deactivate() {
        let type = gumroad.matches(license) ? LicenseType.gumroad : lemon.matches(license) ? LicenseType.lemon  : LicenseType.invalid
        
        switch type {
        case .gumroad:
            self.validationInfo = "Gumroad License"
        case .lemon:
            Task {
                do {
                    let res = try await lemonClient.deactivate(licenseKey: LocalState.license, instanceId: LocalState.instanceId)
                    print(res)
                } catch {
                    print(error)
                }
            }
        case .invalid:
            self.validationInfo = "Invalid License"
        }
    }
}
