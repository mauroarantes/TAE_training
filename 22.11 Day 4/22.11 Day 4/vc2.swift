//
//  vc2.swift
//  22.11 Day 4
//
//  Created by Mauro Arantes on 23/11/2021.
//

import UIKit

class vc2: UIViewController {
    
    var tableView = UITableView()
    var movies: [Movie] = []
    let movieCell = "movieCell"

    override func viewDidLoad() {
        view.backgroundColor = .red
        title = "Top 10 IMDB Movies"
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
        let movie1 = Movie(image: Images.tsr, title: "The Shawshank Redemption")
        let movie2 = Movie(image: Images.tg, title: "The Godfather")
        let movie3 = Movie(image: Images.tgp2, title: "The Godfather Part II")
        let movie4 = Movie(image: Images.tdk, title: "The Dark Knight")
        let movie5 = Movie(image: Images.twelveam, title: "12 Angry Men")
        let movie6 = Movie(image: Images.sl, title: "Schindler's List")
        let movie7 = Movie(image: Images.tlotr, title: "The Lord of the Rings II")
        let movie8 = Movie(image: Images.pf, title: "Pulp Fiction")
        let movie9 = Movie(image: Images.tgtbtu, title: "The Good The Bad The Ugly")
        let movie10 = Movie(image: Images.tlotr2, title: "The Lord of the Rings I")
        
        return [movie1, movie2, movie3, movie4, movie5, movie6, movie7, movie8, movie9, movie10]
    }
}
