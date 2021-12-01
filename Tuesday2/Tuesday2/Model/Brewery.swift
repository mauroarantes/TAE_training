//
//  Brewery.swift
//  Tuesday2
//
//  Created by Mauro Arantes on 30/11/2021.
//

import Foundation

class Brewery {
    var name: String
    var type: String
    var city: String
    var state: String
    
    init(name: String, type: String, city: String, state: String) {
        self.name = name
        self.type = type
        self.city = city
        self.state = state
    }
}
