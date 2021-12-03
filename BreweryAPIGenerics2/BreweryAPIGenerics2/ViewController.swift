//
//  ViewController.swift
//  BreweryAPIGenerics2
//
//  Created by Mauro Arantes on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var brewery = [Brewery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        fetchBrewery()
        // Do any additional setup after loading the view.
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchBrewery() {
        URLSession.shared.getRequest(url: APIEndpoints.breweries, decoding: [Brewery].self) {result in
            switch result {
            case .success(let brewery):
                self.brewery = brewery
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestination = segue.destination as! detailsVC
        segueDestination.modalPresentationStyle = .fullScreen
        if let i = tableview.indexPathForSelectedRow {
            segueDestination.name = brewery[i.row].name
            segueDestination.city = brewery[i.row].city
            segueDestination.state = String(brewery[i.row].state!)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = brewery[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "s1", sender: self)
    }
}



