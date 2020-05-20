//
//  CheckoutView.swift
//  CUPCAKE
//
//  Created by Elhajjaji on 5/20/20.
//  Copyright © 2020 Elhajjaji. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order : Order
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("Cupcakes")
                        .resizable().scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost,specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        // Place the order
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order : Order())
    }
}
