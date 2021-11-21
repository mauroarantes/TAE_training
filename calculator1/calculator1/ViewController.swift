//
//  ViewController.swift
//  calculator1
//
//  Created by Mauro Arantes on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clearAll()
        
    }
    
    var label: String = ""
    //var ans: Int = 0, b: Int = 0
    
    func clearAll() {
        
        label = ""
        calc_label.text = ""
        
        //ans = 0
        
    }
    
    func addtolabel(value: String) {
        
//        if let test = value.firstIndex(of: ".") {
//            label += value
//            let index: Int = value.distance(from: value.startIndex, to: test)
//            print("test =", index)
//        }
//        else {
//            label += value
//            //label +=
//        }
        //print(test)
        label += value
        calc_label.text = label
        
        
    }
    
    func formatresult(result: Double) -> String {
        
//        print(result)
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            
            return String(format: "%.0f", result)
            
        }
        else {
            
            return String(format: "%.4f", result)
            
        }
        
    }

    @IBOutlet weak var calc_label: UILabel!
    
    @IBAction func calc_c(_ sender: Any) {
        
        clearAll()
        
    }
    @IBAction func calc_ml(_ sender: Any) {
        
        label = "-" + label
        let expression = NSExpression(format: label)
        
//        print("exp", expression)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
//        print("res", result)
        let resultstring = formatresult(result: result)
        calc_label.text = resultstring
        label = resultstring
        
    }
    @IBAction func calc_percent(_ sender: Any) {
        addtolabel(value: "/100.00")
        
        let expression = NSExpression(format: label)
        
//        print("exp", expression)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
//        print("res", result)
        let resultstring = formatresult(result: result)
        calc_label.text = resultstring
        label = resultstring
        
    }
    @IBAction func calc_division(_ sender: Any) {
        addtolabel(value: "/")
    }
    @IBAction func calc_multiply(_ sender: Any) {
        addtolabel(value: "*")
    }
    @IBAction func calc_minus(_ sender: Any) {
        addtolabel(value: "-")
    }
    @IBAction func calc_plus(_ sender: Any) {
        addtolabel(value: "+")
    }
    @IBAction func calc_equal(_ sender: Any) {
        
        if label.firstIndex(of: ".") == nil {
            label += ".00"
        }
//        else {
//            label += ".00"
//        }
        
        let expression = NSExpression(format: label)
        
//        print("exp", expression)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
//        print("res", result)
        let resultstring = formatresult(result: result)
        calc_label.text = resultstring
        label = resultstring
        
    }
    @IBAction func calc_point(_ sender: Any) {
        addtolabel(value: ".")
    }
    @IBAction func calc_7(_ sender: Any) {
        addtolabel(value: "7")
    }
    @IBAction func calc_8(_ sender: Any) {
        addtolabel(value: "8")
    }
    @IBAction func calc_9(_ sender: Any) {
        addtolabel(value: "9")
    }
    @IBAction func calc_4(_ sender: Any) {
        addtolabel(value: "4")
    }
    @IBAction func calc_5(_ sender: Any) {
        addtolabel(value: "5")
    }
    @IBAction func calc_6(_ sender: Any) {
        addtolabel(value: "6")
    }
    @IBAction func calc_1(_ sender: Any) {
        addtolabel(value: "1")
    }
    @IBAction func calc_2(_ sender: Any) {
        addtolabel(value: "2")
    }
    @IBAction func calc_3(_ sender: Any) {
        addtolabel(value: "3")
    }
    @IBAction func calc_0(_ sender: Any) {
        addtolabel(value: "0")
    }
}

