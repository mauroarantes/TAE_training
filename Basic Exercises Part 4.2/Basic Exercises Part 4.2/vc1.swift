//
//  vc1.swift
//  Basic Exercises Part 4.2
//
//  Created by Mauro Arantes on 27/11/2021.
//

import UIKit

class vc1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestination = segue.destination as! vc2
        segueDestination.passTextSegue = "Hello World"
        segueDestination.modalPresentationStyle = .fullScreen
        if segue.identifier == "ss1" {
            let controller = segue.destination as! vc2
            controller.isDetailingEnabled = true
        }
    }
    
    @IBAction func S1(_ sender: Any) {
        performSegue(withIdentifier: "s1", sender: nil)
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
