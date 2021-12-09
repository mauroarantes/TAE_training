//
//  Pokemon.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 03/12/2021.
//

import Foundation

struct Raw: Codable {
    let array: [Pokemon]
    let next: String
    
    enum CodingKeys : String, CodingKey {
        case array = "results"
        case next = "next"
    }
}

struct Pokemon: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
