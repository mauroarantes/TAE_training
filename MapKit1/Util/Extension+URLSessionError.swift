//
//  Extension+URLSessionError.swift
//  MapKit1
//
//  Created by Mauro Arantes on 15/12/2021.
//

import Foundation

extension URLSession {
    enum RequestError: Error {
        case badURL
        case badData
    }
}
