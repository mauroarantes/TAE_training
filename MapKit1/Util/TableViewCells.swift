//
//  TableViewCells.swift
//  MapKit1
//
//  Created by Mauro Arantes on 15/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    var ImageView = UIImageView()
    var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ImageView)
        addSubview(label)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a movie and setting image to specific movie passed in array
    func set(_ ru: RandomUser) {
        ImageView.getImage(from: ru.results[0].picture.large)
        label.numberOfLines = 0
        label.text = ru.results[0].name.first + " " + ru.results[0].name.last + "\n" + ru.results[0].email
//        label.text = pokemon.name.capitalized + "\nType " + pokemon.types[0].typ.name
//        label.text = String(pokemon.id) + "\n\n" + pokemon.name.capitalized
//        label.text = pokemon.name.capitalized + " " + String(pokemon.id)
    }
    
    func configureImageView() {
        ImageView.layer.cornerRadius = 10
        ImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        ImageView.widthAnchor.constraint(equalTo: ImageView.heightAnchor).isActive = true
        ImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func setTitleLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
