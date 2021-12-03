//
//  Extension+URLSessionError.swift
//  BreweryAPIGenerics2
//
//  Created by Mauro Arantes on 02/12/2021.
//

import Foundation

extension URLSession {
    enum RequestError: Error {
        case badURL
        case badData
    }
}
