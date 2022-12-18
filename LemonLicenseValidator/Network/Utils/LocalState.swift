//
//  LocalState.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import Foundation

public class LocalState {
    
    private enum Keys: String {
        case instanceId
        case license
    }
    
    public static var instanceId: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.instanceId.rawValue) ?? ""
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.instanceId.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    public static var license: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.license.rawValue) ?? ""
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.license.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
