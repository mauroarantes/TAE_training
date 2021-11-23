//
//  vc1.swift
//  22.11 Day 4
//
//  Created by Mauro Arantes on 22/11/2021.
//

import UIKit

class vc1: UIViewController {
    
    let tvc2 = vc2()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .orange
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction(sender: UIButton!) {
//        print("Button tapped")
        navigationController?.pushViewController(tvc2, animated: true)
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
