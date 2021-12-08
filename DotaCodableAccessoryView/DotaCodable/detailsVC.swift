//
//  detailsVC.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 01/12/2021.
//

import UIKit

class detailsVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var namelb1 : UILabel!
    
    @IBOutlet weak var attributelb1: UILabel!
    
    @IBOutlet weak var attacklb1: UILabel!
    
    @IBOutlet weak var legslb1: UILabel!
    
    var hero: Hero?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        namelb1.text = hero?.name
        attributelb1.text = hero?.primaryAttribute
        attacklb1.text = hero?.attackType
        legslb1.text = "\((hero?.legs)!)"
        let baseURL = "https://api.opendota.com" + (hero?.image)!
        let url = URL(string: baseURL)
        
        image.getImage(from: url!)

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

