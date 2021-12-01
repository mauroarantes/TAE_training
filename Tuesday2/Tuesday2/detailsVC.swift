//
//  detailsVC.swift
//  Tuesday2
//
//  Created by Mauro Arantes on 30/11/2021.
//

import UIKit

class detailsVC: UIViewController {
    
    var name = ""
    var type = ""
    var city = ""
    var state = ""
//    var l1 = UILabel()
    
    @IBOutlet var l1: UILabel!
    
    @IBAction func c1(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        l1.numberOfLines = 0
//        view.backgroundColor = .cyan
        l1.text = name + "\n" + type + "\n" + city + "\n" + state
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
