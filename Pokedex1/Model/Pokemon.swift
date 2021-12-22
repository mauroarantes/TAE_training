//
//  Abilities.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 04/12/2021.
//

import Foundation

struct Pokemon2: Decodable {
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

struct Sprites: Decodable {
    let front: URL
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
    }
}

struct Abilities: Decodable {
    let ability: Ability
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
}

struct Ability: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Moves: Decodable {
    let move: Move
    enum CodingKeys: String, CodingKey {
        case move = "move"
    }
}

struct Move: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Types: Decodable {
    let typ: Typ
    enum CodingKeys: String, CodingKey {
        case typ = "type"
    }
}

struct Typ: Decodable {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
