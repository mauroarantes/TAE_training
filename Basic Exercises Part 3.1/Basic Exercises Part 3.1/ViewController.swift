//
//  ViewController.swift
//  Basic Exercises Part 3.1
//
//  Created by Mauro Arantes on 28/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet var label1: UILabel!
    var label1 = UILabel(), label2 = UILabel()
    var lb1 = UILabel(), lb2 = UILabel(), lb3 = UILabel(), lb4 = UILabel(), lb5 = UILabel()
    let date = Date()
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applystyles(lb: label1)
        applystyles(lb: label2)
        label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor).isActive = true
        
        applystyles2(lb: lb1)
        applystyles2(lb: lb2)
        applystyles2(lb: lb3)
        applystyles2(lb: lb4)
        applystyles2(lb: lb5)
        lb1.text = "label1"
        lb2.text = "label2"
        lb3.text = "label3"
        lb4.text = "label4"
        lb5.text = "label5"
        lb1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 50).isActive = true
        lb2.topAnchor.constraint(equalTo: lb1.bottomAnchor).isActive = true
        lb3.topAnchor.constraint(equalTo: lb2.bottomAnchor).isActive = true
        lb4.topAnchor.constraint(equalTo: lb3.bottomAnchor).isActive = true
        lb5.topAnchor.constraint(equalTo: lb4.bottomAnchor).isActive = true
        
        formatter.dateFormat = "dd.MM.yyyy"
        label1.text = formatter.string(from: date)
        formatter.dateFormat = "HH:mm:ss"
        label2.text = formatter.string(from: date)
        
        // Do any additional setup after loading the view.
    }
    
    func applystyles(lb: UILabel) {
        view.addSubview(lb)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        
        lb.isUserInteractionEnabled = true
        lb.addGestureRecognizer(tap)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
//        lb.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lb.textColor = UIColor.red
        lb.font = UIFont(name: "Verdana", size: 18)
        lb.numberOfLines = 2
        lb.layer.shadowColor = UIColor.darkGray.cgColor
        lb.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func applystyles2(lb: UILabel) {
        view.addSubview(lb)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        
        lb.isUserInteractionEnabled = true
        lb.addGestureRecognizer(tap)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        lb.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lb.textColor = UIColor.red
        lb.font = UIFont(name: "Verdana", size: 18)
        lb.numberOfLines = 2
        lb.layer.shadowColor = UIColor.darkGray.cgColor
        lb.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }


}

