//
//  ViewController.swift
//  ShoppingList1
//
//  Created by Mauro Arantes on 23/11/2021.
//

import UIKit

    class ViewController: UIViewController {
    
    let vc = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Main ViewController"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapFirstButton() {
        vc.groceryList = ["celery", "avocado", "grapes", "bread", "cereal", "rice", "pasta", "fish", "honey"]
//        vc.groceryList = ["apples", "papaya", "tomatoes", "carrots", "eggs", "bread", "cheese", "milk", "coffee"]
//        vc.groceryList = ["oranges", "tea", "cookies", "bell pepper", "corn", "peppers", "platano maduro"]
        navigationController?.pushViewController(vc, animated: true)
    }

}
