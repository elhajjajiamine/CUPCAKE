//
//  Order.swift
//  CUPCAKE
//
//  Created by Elhajjaji on 5/20/20.
//  Copyright © 2020 Elhajjaji. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla","Strawberry","Chocolate","Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false {
                extrafrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extrafrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty ||  streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost:Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extrafrosting {
            cost += Double(quantity)
        }
        if addSprinkles{
            cost += Double(quantity) / 2
        }
        return cost
    }
    
}
