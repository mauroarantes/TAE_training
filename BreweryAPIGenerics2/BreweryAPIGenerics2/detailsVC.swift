//
//  detailsVC.swift
//  BreweryAPIGenerics2
//
//  Created by Mauro Arantes on 03/12/2021.
//

import UIKit

class detailsVC: UIViewController {
    
    var name = ""
    var city = ""
    var state = ""
    
    @IBOutlet var l1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        l1.numberOfLines = 0
//        view.backgroundColor = .cyan
        l1.text = name + "\n" + city + "\n" + state
//        view.addSubview(l1)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
