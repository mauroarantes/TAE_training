//
//  ViewController.swift
//  Tuesday1
//
//  Created by Mauro Arantes on 30/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var breweries = [Brewery]()
    
    override func viewDidLoad() {
        setTableViewDelegates()
        fetchdata()
//        view.backgroundColor = .red
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestination = segue.destination as! detailsVC
//        segueDestination.name = breweries[j].name
        segueDestination.modalPresentationStyle = .fullScreen
        if let i = tableview.indexPathForSelectedRow {
            segueDestination.name = breweries[i.row].name
            segueDestination.type = breweries[i.row].type
            segueDestination.city = breweries[i.row].city
            segueDestination.state = breweries[i.row].state
        }
//        if segue.identifier == "ss1" {
//            let controller = segue.destination as! vc2
//            controller.isDetailingEnabled = true
//        }
    }
    
    func setTableViewDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchdata() {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {return}
        let task = session.dataTask(with: url) {
            data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Smth went wrong")")
                return
            }
            guard let responseData = data else {
                print("No data came back")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: not valid http response")
                return
            }
            print("Response status code: \(httpResponse.statusCode)")
            print("Response status debugDescription: \(httpResponse.debugDescription)")
            print("Response status localizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            do {
                guard let jsondata = try? JSONSerialization.jsonObject(with: responseData, options: [])
            else {
                return
            }
                guard let jsonarray = jsondata as? [Any] else {
                    return
                }
                for post in jsonarray {
                    guard let postDict = post as? [String:Any] else {return}
                    guard let name = postDict["name"] as? String else {return}
                    guard let type = postDict["brewery_type"] as? String else {return}
                    guard let city = postDict["city"] as? String else {return}
                    guard let state = postDict["state"] as? String else {return}

                    self.breweries.append(Brewery(name: name, type: type, city: city, state: state))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
//            print(jsonData)
        }
            
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let j: Int
//        if let i = tableView.indexPathForSelectedRow {
//            j = i.row
//        }
//        navigationController?.pushViewController(dvc, animated: true)
        performSegue(withIdentifier: "s1", sender: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = breweries[indexPath.row].name
        cell?.detailTextLabel?.text = "\(breweries[indexPath.row].city), \(breweries[indexPath.row].state)"
        return cell!
    }
}
