//
//  Raw.swift
//  MovieDatabaseAPI1
//
//  Created by Mauro Arantes on 01/12/2021.
//

import Foundation

struct Raw : Codable {
    let array : [Movie]
    
    enum CodingKeys : String, CodingKey {
        case array = "results"
    }
}
