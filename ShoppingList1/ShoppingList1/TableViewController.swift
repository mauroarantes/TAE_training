//
//  TableViewController.swift
//  ShoppingList1
//
//  Created by Mauro Arantes on 23/11/2021.
//

import UIKit

class TableViewController: UITableViewController {
    var groceryList:[String] = []
    let vc1 = RedViewController()
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groceryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = groceryList[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "s1", sender: nil)
        navigationController?.pushViewController(vc1, animated: true)
    }

}
