//
//  ViewController.swift
//  Basic Exercises Part 5.1
//
//  Created by Mauro Arantes on 24/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var petName: UILabel!
    @IBOutlet var petLegs: UILabel!
    @IBOutlet var petAge: UILabel!
    @IBOutlet var petRace: UILabel!
    
    // Controller continued
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pet = Dog()
        pet.name = "Firulais"
        pet.legs = 4
        pet.age = 2
        pet.race = "Shar Pei"
        
//        petAge.numberOfLines = 0
//        petName.numberOfLines = 0
//        petLegs.numberOfLines = 0
//        petRace.numberOfLines = 0
//
//        petName.adjustsFontSizeToFitWidth = true
//        petLegs.adjustsFontSizeToFitWidth = true
//        petAge.adjustsFontSizeToFitWidth = true
//        petRace.adjustsFontSizeToFitWidth = true
//
//        petAge.translatesAutoresizingMaskIntoConstraints = false
//        petRace.translatesAutoresizingMaskIntoConstraints = false
//        petLegs.translatesAutoresizingMaskIntoConstraints = false
//        petName.translatesAutoresizingMaskIntoConstraints = false
        
        petName.text = pet.name!
        petLegs.text = "\(pet.legs!) legs"
        petAge.text = "\(pet.age!) years old"
        petRace.text = pet.race!
    }

}

