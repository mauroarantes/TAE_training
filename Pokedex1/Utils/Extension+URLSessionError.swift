//
//  Extension+URLSessionError.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 03/12/2021.
//

import Foundation

extension URLSession {
    enum RequestError: Error {
        case badURL
        case badData
    }
}
