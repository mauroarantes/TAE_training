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
    @IBOutlet var l1: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        l1.text = pokDetails!.name.capitalized + "\nType " + pokDetails!.types[0].typ.name + "\n\nMoves:\n"
        for each in pokDetails!.moves {
            l1.text? += each.move.name.capitalized + ", "
        }
        l1.text? = String(l1.text.dropLast(2))
        l1.text? += "\n\nAbilities:\n"
        for each in pokDetails!.abilities {
            l1.text? += each.ability.name.capitalized + ", "
        }
        l1.text? = String(l1.text.dropLast(2))
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
