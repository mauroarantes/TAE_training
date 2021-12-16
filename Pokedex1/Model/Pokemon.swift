//
//  Abilities.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 04/12/2021.
//

import Foundation

struct Pokemon2: Codable {
    let name: String
    let id: Int
    let abilities: [Abilities]
    let sprites: Sprites!
    let types: [Types]
    let moves: [Moves]
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case abilities = "abilities"
        case sprites = "sprites"
        case types = "types"
        case moves = "moves"
    }
}

struct Sprites: Codable {
    let front: URL
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
    }
}

struct Abilities: Codable {
    let ability: Ability
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
}

struct Ability: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Moves: Codable {
    let move: Move
    enum CodingKeys: String, CodingKey {
        case move = "move"
    }
}

struct Move: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Types: Codable {
    let typ: Typ
    enum CodingKeys: String, CodingKey {
        case typ = "type"
    }
}

struct Typ: Codable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
