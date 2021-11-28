//
//  vc2.swift
//  Basic Exercises Part 4.2
//
//  Created by Mauro Arantes on 27/11/2021.
//

import UIKit

class vc2: UIViewController {
    
    var passTextSegue: String?
    var isDetailingEnabled = false
    
    @IBOutlet var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = passTextSegue
        print(isDetailingEnabled)

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
