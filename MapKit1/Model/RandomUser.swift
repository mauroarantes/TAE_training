//
//  RandomUser.swift
//  MapKit1
//
//  Created by Mauro Arantes on 15/12/2021.
//

import Foundation

// MARK: - RandomUser
struct RandomUser: Codable {
    let results: [Result1]
}

// MARK: - Result
struct Result1: Codable {
    let name: Name
    let location: Location
    let email: String
    let picture: Picture
}

// MARK: - Location
struct Location: Codable {
    let coordinates: Coordinates
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: URL
}
