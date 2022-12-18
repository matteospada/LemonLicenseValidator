//
//  ContentView.swift
//  LemonLicenseValidator
//
//  Created by Matteo Spada on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Insert your license key", text: $vm.license)
                Button {
                    vm.validate()
                } label: {
                    Text("Submit")
                }
            }
            Text(vm.validationInfo)
            Spacer()
        }
        .frame(width: 500, height: 400, alignment: .leading)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
