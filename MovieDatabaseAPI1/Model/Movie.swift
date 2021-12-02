//
//  Movie.swift
//  MovieDatabaseAPI1
//
//  Created by Mauro Arantes on 01/12/2021.
//

import Foundation

struct Movie: Codable {
    let name: String
    let description: String
    let year: String
    let rating: Float
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case description = "overview"
        case year = "release_date"
        case rating = "vote_average"
        case image = "poster_path"
    }
}
