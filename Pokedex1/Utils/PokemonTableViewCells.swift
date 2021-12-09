//
//  PokemonTableViewCells.swift
//  Pokedex1
//
//  Created by Mauro Arantes on 04/12/2021.
//

import UIKit

class PokTableViewCell: UITableViewCell {

    var pokImageView = UIImageView()
    var poklabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pokImageView)
        addSubview(poklabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a movie and setting image to specific movie passed in array
    func set(_ pokemon: Pokemon2) {
//        pokImageView.image = pokemon.sprites.front
        pokImageView.getImage(from: pokemon.sprites.front)
        poklabel.text = pokemon.name.capitalized + "\nType " + pokemon.types[0].typ.name
//        poklabel.text = String(pokemon.id) + "\n\n" + pokemon.name.capitalized
//        poklabel.text = pokemon.name.capitalized + " " + String(pokemon.id)
    }
    
    func configureImageView() {
        pokImageView.layer.cornerRadius = 10
        pokImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        poklabel.numberOfLines = 0
        poklabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        pokImageView.translatesAutoresizingMaskIntoConstraints = false
        pokImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        pokImageView.widthAnchor.constraint(equalTo: pokImageView.heightAnchor).isActive = true
        pokImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setTitleLabelConstraints() {
        poklabel.translatesAutoresizingMaskIntoConstraints = false
        poklabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        poklabel.leadingAnchor.constraint(equalTo: pokImageView.trailingAnchor, constant: 20).isActive = true
        poklabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        poklabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
