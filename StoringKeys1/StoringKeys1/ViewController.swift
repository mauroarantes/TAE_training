//
//  ViewController.swift
//  StoringKeys1
//
//  Created by Mauro Arantes on 13/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let key = "uai"
        let tag = "com.example.keys.mykey".data(using: .utf8)!
        let addquery: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: tag,
                                       kSecValueRef as String: key]
        
        let status = SecItemAdd(addquery as CFDictionary, nil)
        print("Operation finished with status: \(status)")
        let t1 = SecCopyErrorMessageString(status, nil)
        print(t1!)
//        guard status == errSecSuccess else { throw error }
//
//        let getquery: [String: Any] = [kSecClass as String: kSecClassKey,
//                                       kSecAttrApplicationTag as String: tag,
//                                       kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
//                                       kSecReturnRef as String: true]

//        var item: CFTypeRef?
//        let status = SecItemCopyMatching(addquery as CFDictionary, &item)
//        guard status == errSecSuccess else { throw <# an error #> }
//        let key = item as! SecKey
        
    }


}

