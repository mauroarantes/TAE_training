//
//  vc2.swift
//  Week 2 Exam
//
//  Created by Mauro Arantes on 24/11/2021.
//

import UIKit

class vc2: UIViewController {
    
    var tableView = UITableView()
    var movies: [Movie] = []
    let movieCell = "movieCell"
//    let tvc3 = vc3()

    override func viewDidLoad() {
//        view.backgroundColor = .red
        self.title = "Curated List"
        configureTableView()
        setTableViewDelegates()
        movies = fetchData()
        configureTableView()
        setTableViewDelegates()

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        //manually adding tableview to VC programmatically
        view.addSubview(tableView)
        tableView.rowHeight = 200
        //set delegates
        //set row height
        //register cells
        //set constraints
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: movieCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("row: \(indexPath.row)")
        let tvc3 = vc3()
        if let i = tableView.indexPathForSelectedRow {
            tvc3.number = i.row
        }
//        tvc3.text = "uai"
//        print(tvc3.number)
        
        navigationController?.pushViewController(tvc3, animated: true)
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

extension vc2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.set(movie)
        
        return cell
    }
}

extension vc2 {
    
    func fetchData() -> [Movie] {
        let movie1 = Movie(image: Images.mano, title: "Mano Brown - Boogie Naipe")
        let movie2 = Movie(image: Images.clco, title: "Clown Core - Toilet")
        let movie3 = Movie(image: Images.nazu, title: "Nação Zumbi - Nação Zumbi")
        let movie4 = Movie(image: Images.anti, title: "Antibalas - Antibalas")
        let movie5 = Movie(image: Images.vulf, title: "Vulfpeck - The Beautiful Game")
        let movie6 = Movie(image: Images.blpu, title: "Black Pumas - Black Pumas")
        let movie7 = Movie(image: Images.rhcp, title: "Red Hot Chili Peppers - The Getaway")
        let movie8 = Movie(image: Images.crio, title: "Criolo - Nó na orelha")
        let movie9 = Movie(image: Images.meta, title: "Metá Metá - Metá Metá")
        let movie10 = Movie(image: Images.daft, title: "Daft Punk - Random Access Memories")
        
        let list = [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10]
        return list.sorted {$0.title < $1.title}
        
//        return [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10]
    }
}

