//
//  ViewController.swift
//  UsingIOSKeychain1
//
//  Created by Mauro Arantes on 12/12/2021.
//

import UIKit
import Security

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let keychainItemQuery = [
//          kSecValueData: "Pullip2020".data(using: .utf8)!,
//          kSecClass: kSecClassGenericPassword
//        ] as CFDictionary
//
//        let status = SecItemAdd(keychainItemQuery, nil)
//        print("Operation finished with status: \(status)")
        
//        let keychainItem = [
//          kSecValueData: "Pullip2020".data(using: .utf8)!,
//          kSecAttrAccount: "andyibanez",
//          kSecAttrServer: "pullipstyle.com",
//          kSecClass: kSecClassInternetPassword
//        ] as CFDictionary
//
//        let status = SecItemAdd(keychainItem, nil)
//        print("Operation finished with status: \(status)")
        
//        let keychainItem = [
//          kSecValueData: "Pullip2020".data(using: .utf8)!,
//          kSecAttrAccount: "andyibanez",
//          kSecAttrServer: "pullipstyle.com",
//          kSecClass: kSecClassInternetPassword,
//          kSecReturnAttributes: true
//        ] as CFDictionary
//
//        var ref: AnyObject?
//
//        let status = SecItemAdd(keychainItem, &ref)
//        let result = ref as? NSDictionary
//
//        let t1 = SecCopyErrorMessageString(status, nil)
//        print(t1!)
//        print("Website: \(result?[kSecAttrServer] ?? "")")
//        print("Operation finished with status: \(status)")
//        print("Returned attributes:")
//        result?.forEach { key, value in
//          print("\(key): \(value)")
//        }
        
//        let keychainItem = [
//          kSecValueData: "Pullip2020".data(using: .utf8)!,
//          kSecAttrAccount: "andyibanez",
//          kSecAttrServer: "pullipstyle.com",
//          kSecClass: kSecClassInternetPassword,
//          kSecReturnData: true
//        ] as CFDictionary
//
//        var ref: AnyObject?
//
//        let status = SecItemAdd(keychainItem, &ref)
//        let result = ref as! Data
//        print("Operation finished with status: \(status)")
//        let password = String(data: result, encoding: .utf8)!
//        print("Password: \(password)")
        
//        let keychainItem = [
//          kSecValueData: "Pullip2020".data(using: .utf8)!,
//          kSecAttrAccount: "andyibanez",
//          kSecAttrServer: "pullipstyle.com",
//          kSecClass: kSecClassInternetPassword,
//          kSecReturnData: true,
//          kSecReturnAttributes: true
//        ] as CFDictionary
//
//        var ref: AnyObject?
//
//        let status = SecItemAdd(keychainItem, &ref)
//        let result = ref as! NSDictionary
//        print("Operation finished with status: \(status)")
//        print("Username: \(result[kSecAttrAccount] ?? "")")
//        let passwordData = result[kSecValueData] as! Data
//        let passwordString = String(data: passwordData, encoding: .utf8)
//        print("Password: \(passwordString ?? "")")
        
//        let usernames = ["andyibanez1", "alice", "eileen", "blackberry"]
//
//        usernames.forEach { username in
//          let keychainItem = [
//            kSecValueData: "\(username)-Pullip2020".data(using: .utf8)!,
//            kSecAttrAccount: username,
//            kSecAttrServer: "pullipstyle.com",
//            kSecClass: kSecClassInternetPassword,
//            kSecReturnData: true,
//            kSecReturnAttributes: true
//          ] as CFDictionary
//
//          var ref: AnyObject?
//
//          let status = SecItemAdd(keychainItem, &ref)
//          let result = ref as! NSDictionary
//          print("Operation finished with status: \(status)")
//          print("Username: \(result[kSecAttrAccount] ?? "")")
//          let passwordData = result[kSecValueData] as! Data
//          let passwordString = String(data: passwordData, encoding: .utf8)
//          print("Password: \(passwordString ?? "")")
//        }
        
//        let query = [
//          kSecClass: kSecClassInternetPassword,
//          kSecAttrServer: "pullipstyle.com",
//          kSecReturnAttributes: true,
//          kSecReturnData: true
//        ] as CFDictionary
//
//        var result: AnyObject?
//        let status = SecItemCopyMatching(query, &result)
//
//        print("Operation finished with status: \(status)")
//        let dic = result as! NSDictionary
//
//        let username = dic[kSecAttrAccount] ?? ""
//        let passwordData = dic[kSecValueData] as! Data
//        let password = String(data: passwordData, encoding: .utf8)!
//        print("Username: \(username)")
//        print("Password: \(password)")
        
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "pullipstyle.com",
          kSecReturnAttributes: true,
          kSecReturnData: true,
          kSecMatchLimit: 5
        ] as CFDictionary

        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)

        print("Operation finished with status: \(status)")
        let array = result as! [NSDictionary]

        array.forEach { dic in
          let username = dic[kSecAttrAccount] ?? ""
          let passwordData = dic[kSecValueData] as! Data
          let password = String(data: passwordData, encoding: .utf8)!
          print("Username: \(username)")
          print("Password: \(password)")
        }
        
//        let query = [
//          kSecClass: kSecClassInternetPassword,
//          kSecAttrServer: "pullipstyle.com",
//        ] as CFDictionary
//
//        let updateFields = [
//          kSecValueData: "newPassword".data(using: .utf8)!
//        ] as CFDictionary
//
//        let status = SecItemUpdate(query, updateFields)
//        print("Operation finished with status: \(status)")
        
        let query1 = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "pullipstyle.com"
        ] as CFDictionary

        SecItemDelete(query1)
        
    }
    
}

