//
//  ViewController.swift
//  MapKit1
//
//  Created by Mauro Arantes on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableview = UITableView()
    let c1 = "c1"
    var RUarray = [RandomUser]()
    let semaphore = DispatchSemaphore(value: 0)
    var isPaginating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configureTableView()
        setupDelegates()
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        //manually adding tableview to VC programmatically
        view.addSubview(tableview)
        tableview.rowHeight = 120
        
        self.title = "MapKit"
        
        //set delegates
        //set row height
        //register cells
        //set constraints
        tableview.register(TableViewCell.self, forCellReuseIdentifier: c1)
        tableview.pin(view)
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchData () {
        print("Fetch more data!")
        for i in 1...50 {
            URLSession.shared.getRequest(url: APIEndpoints.url, decoding: RandomUser.self) {result in
                switch result {
                case .success(let data):
                    self.RUarray.append(contentsOf: [data])
                case .failure(let error):
                    print(error)
                }
                if i == 50 {
                    self.semaphore.signal()
                }
            }
        }
        DispatchQueue.main.async {
            self.semaphore.wait()
            self.isPaginating = false
            self.tableview.reloadData()
            if self.RUarray.count < 8 {
                self.fetchData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(RUarray.count)
        return RUarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if RUarray.count > 88 {
            self.isPaginating = true
            print("ii", RUarray.count)
        }
        lazy var mycell: TableViewCell = {
            let cell = tableview.dequeueReusableCell(withIdentifier: "c1") as! TableViewCell
            let ru = RUarray[indexPath.row]
            cell.set(ru)
            return cell
        }()
        return mycell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "s1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueDestination = segue.destination as? MapViewController {
            segueDestination.RU = RUarray[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableview.contentSize.height-400-scrollView.frame.size.height) {
            guard !self.isPaginating else {return}
            self.isPaginating = true
            fetchData()
        }
    }
}




