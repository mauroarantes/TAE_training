//
//  UserDefaults+Extension.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 06/12/2021.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys: String {
        case boolArray
    }
    
    var boolArray:[Any]? {
        get {
            array(forKey: UserDefaultKeys.boolArray.rawValue)
        }
        set {
            set(newValue, forKey: UserDefaultKeys.boolArray.rawValue)
        }
    }
}
