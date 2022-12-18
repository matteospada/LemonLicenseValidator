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
            VStack {
                TextField("Insert your license key", text: $vm.license)
                Text(vm.validationInfo)
            }
            
            HStack {
                Button {
                    vm.deactivate()
                } label: {
                    Text("Deactivate")
                }
                
                Button {
                    vm.activate()
                } label: {
                    Text("Activate")
                }
                
                Button {
                    vm.deactivate()
                } label: {
                    Text("Validate")
                }

            }
            .padding()
            
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
