//
//  Extension+UITableViewCell.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 07/12/2021.
//

import UIKit

class myCell: UITableViewCell {
    var link: ViewController?
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Array init
        if let _ = UserDefaults.standard.boolArray {
        } else {
            let b1 = false
            UserDefaults.standard.boolArray = Array(repeating: b1, count: 122)
            print("..", UserDefaults.standard.boolArray!)
        }
        let im1 = UIImage(named: "icons8-star-filled-48")
        let favButton = UIButton(type: .system)
        favButton.setImage(im1, for: .normal)
        favButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        accessoryView = favButton
        favButton.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    @objc
    func imageTapped(cell : UITableViewCell) {
        print("Image was tapped \n")
        link?.f1(cell: self)
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
