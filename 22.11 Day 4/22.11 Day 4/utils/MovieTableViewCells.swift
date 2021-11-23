//
//  MovieTableViewCells.swift
//  22.11 Day 4
//
//  Created by Mauro Arantes on 23/11/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var movieImageView = UIImageView()
    var movieTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(movieImageView)
        addSubview(movieTitle)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a movie and setting image to specific movie passed in array
    func set(_ movie: Movie) {
        movieImageView.image = movie.image
        movieTitle.text = movie.title
    }
    
    func configureImageView() {
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        movieTitle.numberOfLines = 0
        movieTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setTitleLabelConstraints() {
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
