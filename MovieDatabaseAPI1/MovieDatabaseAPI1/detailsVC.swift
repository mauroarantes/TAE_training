//
//  detailsVC.swift
//  MovieDatabaseAPI1
//
//  Created by Mauro Arantes on 01/12/2021.
//

import UIKit

class detailsVC: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var yearlabel : UILabel!
    
    @IBOutlet weak var desclabel: UILabel!
    
//    @IBOutlet weak var attacklb1: UILabel!
//
//    @IBOutlet weak var legslb1: UILabel!
    
    var movie: Movie?
    var temp: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        temp = movie?.year
        yearlabel.text = String(temp!.prefix(4))
        desclabel.text = movie?.description
        desclabel.numberOfLines = 0
//        attacklb1.text = hero?.attackType
//        legslb1.text = "\((hero?.legs)!)"
        let baseURL = "https://www.themoviedb.org/t/p/w1280" + (movie?.image)!
        let url = URL(string: baseURL)
        
        image.getImage(from: url!)

        // Do any additional setup after loading the view.
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
