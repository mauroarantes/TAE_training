//
//  ViewController.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableview = UITableView()
    let pokCell = "pokCell"
    var pokemons = [Pokemon]()
    var auxArray2 = [Pokemon]()
    var auxArray1 = [Pokemon2]()
    var pokDetails = [Pokemon2]()
    let semaphore = DispatchSemaphore(value: 0)
    let rpt: Pokemon2 = Pokemon2(name: "-1", id: -1, abilities: [Abilities(ability: Ability(name: "-1")), Abilities(ability: Ability(name: "-2"))], sprites: nil, types: [Types(typ: Typ(name: "-1"))])
    var nextURL: URL!
    var pokURL: URL!
    var isPaginating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokDetails = Array(repeating: self.rpt, count: 150)
        fetchFirstData()
        configureTableView()
        setupDelegates()
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        //manually adding tableview to VC programmatically
        view.addSubview(tableview)
        tableview.rowHeight = 200
        //set delegates
        //set row height
        //register cells
        //set constraints
        tableview.register(PokTableViewCell.self, forCellReuseIdentifier: pokCell)
        tableview.pin(view)
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchFirstData () {
        URLSession.shared.getRequest(url: APIEndpoints.url, decoding: Raw.self) {result in
            switch result {
            case .success(let data):
                self.pokemons.append(contentsOf: data.array)
                
                for (_, pokemon) in self.pokemons.enumerated() {
                    self.pokURL = URL(string: pokemon.url)
                    URLSession.shared.getRequest(url: self.pokURL, decoding: Pokemon2.self) {result in
                        switch result {
                        case .success(let data):
                            self.pokDetails[data.id-1] = data
                            self.auxArray1.append(contentsOf: [data])
                            if self.auxArray1.count == 30 {
                                self.semaphore.signal()
                            }

                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                
                self.nextURL = URL(string: data.next)
                DispatchQueue.main.async {
                    self.isPaginating = false
                    self.semaphore.wait()
                    self.auxArray1 = []
                    self.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchData() {
        print("Fetch more data!")
            URLSession.shared.getRequest(url: self.nextURL, decoding: Raw.self) {result in
                switch result {
                case .success(let data):
                    self.pokemons.append(contentsOf: data.array)
                    self.auxArray2.append(contentsOf: data.array)
                    for (_, pokemon) in self.auxArray2.enumerated() {
                        self.pokURL = URL(string: pokemon.url)
                        URLSession.shared.getRequest(url: self.pokURL, decoding: Pokemon2.self) {result in
                            switch result {
                            case .success(let data):
                                self.pokDetails[data.id-1] = data
                                self.auxArray1.append(contentsOf: [data])
                                if self.auxArray1.count == 30 {
                                    self.semaphore.signal()
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                    
                    self.nextURL = URL(string: data.next)
                    DispatchQueue.main.async {
                        self.isPaginating = false
                        self.semaphore.wait()
                        self.auxArray1 = []
                        self.auxArray2 = []
                        self.tableview.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard pokDetails[indexPath.row].id != -1, indexPath.row+1 == pokDetails[indexPath.row].id  else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = String(pokDetails[indexPath.row].id) + " " + pokDetails[indexPath.row].name
            return cell
        }
    
        if indexPath.row > 120 {
            self.isPaginating = true
        }
        
        lazy var mycell: PokTableViewCell = {
            let cell = tableview.dequeueReusableCell(withIdentifier: "pokCell") as! PokTableViewCell
            let pokemon = pokDetails[indexPath.row]
            cell.set(pokemon)
            return cell
        }()
        return mycell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "s1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueDestination = segue.destination as? detailsVC {
            segueDestination.pokDetails = pokDetails[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableview.contentSize.height-400-scrollView.frame.size.height) {
            guard !self.isPaginating else {return}
            fetchData()
            self.isPaginating = true
        }
    }
}


