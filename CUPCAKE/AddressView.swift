//
//  AddressView.swift
//  CUPCAKE
//
//  Created by Elhajjaji on 5/20/20.
//  Copyright © 2020 Elhajjaji. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    var body: some View {
        Form {
            Section{
                TextField("Name",text:$order.name)
                TextField("Street addres",text:$order.streetAddress)
                TextField("City",text:$order.city)
                TextField("Zip",text:$order.zip)
            }
            Section{
                NavigationLink(destination:CheckoutView(order:order)) {
                    Text("Check Out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details",displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
