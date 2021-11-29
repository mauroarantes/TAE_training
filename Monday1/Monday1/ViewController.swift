//
//  ViewController.swift
//  Monday1
//
//  Created by Mauro Arantes on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let params = [
            "title", "Week 3 Day 1",
            "body", "Making URL network requests using URLSession"
        ]
        guard let url = URL(string: "https://www.7timer.info/bin/api.pl?lon=113.17&lat=23.09&product=astro&output=json") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try?
        JSONSerialization.data(withJSONObject: params, options: [])
        let _:Void = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                do {
                    let jsonData  = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("Data: \(String(describing: jsonData))")
                    } catch {
                        print(error)
                            }
//                let jsonData = try?
//                JSONSerialization.jsonObject(with: data!, options: [])
//                print(jsonData!)
            }
            DispatchQueue.main.async {
                self.view.backgroundColor = .cyan
            }
        }
        .resume()
        }

    
    func fetchposts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        let _ = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                let jsonData = try?
                JSONSerialization.jsonObject(with: data!, options: [])
                print("Response: \(String(describing: jsonData))")
            }
        }
    }
}



