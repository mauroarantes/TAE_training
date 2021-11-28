//
//  vc1.swift
//  Basic Exercises Part 4.1
//
//  Created by Mauro Arantes on 27/11/2021.
//

import UIKit

class vc1: UIViewController {
    
    @IBAction func onButtonTap() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "id1") as! vc2
        vc.passText = "Hello World"
        vc.modalPresentationStyle = .fullScreen
          
        present(vc, animated: true, completion: nil)
      }

    override func viewDidLoad() {
        super.viewDidLoad()

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
