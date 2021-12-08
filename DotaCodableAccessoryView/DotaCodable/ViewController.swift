//
//  ViewController.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var heroes = [Hero]()

    override func viewDidLoad() {
        setUpTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func f1 (cell: UITableViewCell) {
        let tvi = tableview.indexPath(for: cell)
        
        guard let b2 = UserDefaults.standard.boolArray![tvi![1]] as? Bool else {print("11");return}
        
        if b2 {
            UserDefaults.standard.boolArray![tvi![1]] = false
        } else {
            UserDefaults.standard.boolArray![tvi![1]] = true
        }
        tableview.reloadRows(at: [tvi!], with: .fade)
        print("22", UserDefaults.standard.boolArray!)
    }
    
    func setUpTableView() {
        fetchJson {
            self.tableview.reloadData()
        }
        tableview.register(myCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
    }

    func fetchJson(completed: @escaping()->()) {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else {return}
        let session =  URLSession.shared
        
        let task = session.dataTask(with: url) {data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something happened here")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("server error")
                return
            }
            
            guard data != nil else {
                print("Error: we do not have data bub")
                return
            }
            
            do {
                self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! myCell
        cell.textLabel?.text = heroes[indexPath.row].name.capitalized
        cell.link = self
        guard let b4 = UserDefaults.standard.boolArray![indexPath.row] as? Bool else {print("44");return cell}
        cell.accessoryView?.tintColor = b4 ? UIColor.orange : .systemGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let b4 = UserDefaults.standard.boolArray![indexPath.row] as? Bool else {print("44");return}
        tableview.cellForRow(at: indexPath)?.tintColor = b4 ? UIColor.orange : .systemGray
        performSegue(withIdentifier: "s1", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let b4 = UserDefaults.standard.boolArray![indexPath.row] as? Bool else {print("44");return}
        tableview.cellForRow(at: indexPath)?.tintColor = b4 ? UIColor.orange : .systemGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? detailsVC {
            destination.hero = heroes[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
}

