//
//  File.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 01/12/2021.
//

import Foundation

struct Hero: Codable {
    let name: String
    let primaryAttribute: String
    let attackType: StringLiteralType
    let legs: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "localized_name"
        case primaryAttribute = "primary_attr"
        case attackType = "attack_type"
        case legs = "legs"
        case image = "img"
    }
}
