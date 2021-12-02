//
//  ViewController.swift
//  MovieDatabaseAPI1
//
//  Created by Mauro Arantes on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        setUpTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView() {
        fetchJson {
            self.tableview.reloadData()
        }
        tableview.delegate = self
        tableview.dataSource = self
    }

    func fetchJson(completed: @escaping()->()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=7500ad90b14332017f5650461885d4b7&language=en-US&page=1") else {return}
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
                let temp = try JSONDecoder().decode(Raw.self, from: data!)
                self.movies = temp.array
//                self.movies = try JSONDecoder().decode([Movie].self, from: data!)
                
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
//                print("Error: \(error.localizedDescription)")
                print("Error: \(error)")
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        let str = String(format: "%.1f", movies[indexPath.row].rating)
        cell.textLabel?.text = movies[indexPath.row].name.capitalized + "\nRating " + str
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "s1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? detailsVC {
            destination.movie = movies[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
}



