//
//  Order.swift
//  CUPCAKE
//
//  Created by Elhajjaji on 5/20/20.
//  Copyright © 2020 Elhajjaji. All rights reserved.
//

import Foundation

class Order: ObservableObject , Codable{
    enum CodingKeys: CodingKey {
        case type, quantity, extrafrosting, addSprinkles, name, streetAddress, city, zip
    }
    
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
    
    init() {
        
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extrafrosting = try container.decode(Bool.self, forKey: .extrafrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
           try container.encode(type, forKey: .type)
           try container.encode(quantity, forKey: .quantity)

           try container.encode(extrafrosting, forKey: .extrafrosting)
           try container.encode(addSprinkles, forKey: .addSprinkles)

           try container.encode(name, forKey: .name)
           try container.encode(streetAddress, forKey: .streetAddress)
           try container.encode(city, forKey: .city)
           try container.encode(zip, forKey: .zip)
    
    }
}
