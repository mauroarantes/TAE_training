//
//  detailsVC.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 03/12/2021.
//

import UIKit

class detailsVC: UIViewController {
    
    var pokDetails: Pokemon2?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var l1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        l1.numberOfLines = 0
        l1.text = pokDetails!.name.capitalized + "\n\nAbilities:\n"
        for each in pokDetails!.abilities {
            l1.text? += "\n" + each.ability.name.capitalized
        }
        imageView.getImage(from: pokDetails!.sprites.front)
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
