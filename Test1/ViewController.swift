//
//  ViewController.swift
//  Test1
//
//  Created by Mauro Arantes on 18/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var segue:String = "segue1"

    @IBAction func S1(_ sender: Any) {
        performSegue(withIdentifier: segue, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

