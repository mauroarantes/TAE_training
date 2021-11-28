//
//  vc3.swift
//  Week 2 Exam
//
//  Created by Mauro Arantes on 24/11/2021.
//

import UIKit

class vc3: UIViewController {
    
    var text: String = ""
    var number: Int = 0
//    var movieImageLabel = UIImageLabel()
    var movies: [Movie] = []
    let textLabel = UILabel()
    let movieImageView = UIImageView()
    
//    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
//        let textLabel = UILabel(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
//        textLabel.backgroundColor = .orange
//        textLabel.text = "\(number)"
//        textLabel.textAlignment = .center
//        view.addSubview(textLabel)
//        print(number)
        
        movies = fetchData()
//        let textLabel = UILabel(frame: CGRect(x: 50, y: 400, width: 300, height: 100))
//        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        textLabel.backgroundColor = .orange
//        textLabel.text = "\(number)"
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
//        view.addSubview(textLabel)
        
//        let movieImageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
//        let movieImageView = UIImageView()
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
//        configureImageLabel()
//        setImageConstraints()
        switch number {
        case 0:
            movieImageView.image = Images.anti
            textLabel.text = "Antibalas\nThis album is exciting and lively."
            self.title = "Antibalas"
        case 1:
            movieImageView.image = Images.blpu
            textLabel.text = "Black Pumas\nThis album is relaxing and peaceful."
            self.title = "Black Pumas"
        case 2:
            movieImageView.image = Images.clco
            textLabel.text = "Toilet\nThis album is energic and mind blowing."
            self.title = "Clown Core"
        case 3:
            movieImageView.image = Images.crio
            textLabel.text = "Nó na Orelha\nThis album is cool and joyful."
            self.title = "Criolo"
        case 4:
            movieImageView.image = Images.daft
            textLabel.text = "Random Access Memories\nThis album is futuristic and innovative."
            self.title = "Daft Punk"
        case 5:
            movieImageView.image = Images.mano
            textLabel.text = "Boogie Naipe\nThis album is funky and jazzy."
            self.title = "Mano Brown"
        case 6:
            movieImageView.image = Images.meta
            textLabel.text = "Metá Metá\nThis album is Latin and original."
            self.title = "Metá Metá"
        case 7:
            movieImageView.image = Images.nazu
            textLabel.text = "Nação Zumbi\nThis album is strong and heavy."
            self.title = "Nação Zumbi"
        case 8:
            movieImageView.image = Images.rhcp
            textLabel.text = "The Getaway\nThis album is creative and powerful."
            self.title = "Red Hot Chili Peppers"
        case 9:
            movieImageView.image = Images.vulf
            textLabel.text = "The Beautiful Game\nThis album is groovy and catchy."
            self.title = "Vulfpeck"
        default:
            break
        }
//        movieImageLabel.image = Images.anti
        view.addSubview(movieImageView)
        view.addSubview(textLabel)
        
        setImageConstraints()
        setTitleLabelConstraints()
//        NSLayoutConstraint.activate([
//          textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//          textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
//          ])
//
//        NSLayoutConstraint.activate([
//          movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
//          movieImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
//          ])
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    func setTitleLabelConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 12).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

//    func configureImageLabel() {
//        movieImageLabel.layer.cornerRadius = 10
//        movieImageLabel.clipsToBounds = true
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension vc3 {
    
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
