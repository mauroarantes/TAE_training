//
//  vc3.swift
//  Week 2 Exam
//
//  Created by Mauro Arantes on 24/11/2021.
//

import UIKit

class vc3: UIViewController {
    
    var detailsView = MusicDetailsView()
    var number: Int = 0
    var list: [Music] = []

    override func viewDidLoad() {
        configureView()
        list = fetchData()
        configureView()
        detailsView.set(list[number])
        self.title = list[number].title
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        //manually adding tableview to VC programmatically
        view.addSubview(detailsView)
//        tableView.rowHeight = 200
        //set delegates
        //set row height
        //register cells
        //set constraints
//        tableView.register(MusicTableViewCell.self, forCellReuseIdentifier: musicCell)
        detailsView.pin(view)
//        detailsView.delegate = self
//        detailsView.dataSource = self
    }

    /*
    // MARK: _ Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension vc3 {
    
    func fetchData() -> [Music] {
        let music1 = Music(image: Images.mano, title: "Mano Brown", album: "Boogie Naipe", details: "This album is funky and jazzy.")
        let music2 = Music(image: Images.clco, title: "Clown Core", album: "Toilet", details: "This album is energic and mind blowing.")
        let music3 = Music(image: Images.nazu, title: "Nação Zumbi", album: "Nação Zumbi", details: "This album is heavy and hard core.")
        let music4 = Music(image: Images.anti, title: "Antibalas", album: "Antibalas", details: "This album is exciting and lively.")
        let music5 = Music(image: Images.vulf, title: "Vulfpeck", album: "The Beautiful Game", details: "This album is groovy and catchy.")
        let music6 = Music(image: Images.blpu, title: "Black Pumas", album: "Black Pumas", details: "This album is relaxig and peaceful.")
        let music7 = Music(image: Images.rhcp, title: "Red Hot Chili Peppers", album: "The Getaway", details: "This album is creative and powerful.")
        let music8 = Music(image: Images.crio, title: "Criolo", album: "Nó na orelha", details: "This album is cool and joyful.")
        let music9 = Music(image: Images.meta, title: "Metá Metá", album: "Metá Metá", details: "This album is Latin and original.")
        let music10 = Music(image: Images.daft, title: "Daft Punk", album: "Random Access Memories", details: "This album is futuristic and innovative.")
        
        let list = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
        return list.sorted {$0.title < $1.title}
        
//        return [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}
