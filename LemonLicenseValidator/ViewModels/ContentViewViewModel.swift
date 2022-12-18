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
    
    func validate() {
        self.validationInfo = gumroad.matches(license) ? "Gumroad" : lemon.matches(license) ? "Lemon Squeezy" : "Incorrect Format"
    }
}
