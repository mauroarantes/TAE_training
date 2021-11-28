//
//  File.swift
//  Week 2 Exam
//
//  Created by Mauro Arantes on 26/11/2021.
//

import UIKit

class MusicDetailsView: UIView {

    var musicImageView = UIImageView()
    var musicDetails = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:  frame)
        backgroundColor = .systemBackground
        addSubview(musicImageView)
        addSubview(musicDetails)
        
        configureImageView()
        configureDetailsLabel()
        setImageConstraints()
        setDetailsLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //passing through a music and setting image to specific music passed in array
    func set(_ music: Music) {
        musicImageView.image = music.image
        musicDetails.text = music.album + "\n" + music.details
    }
    
    func configureImageView() {
        musicImageView.layer.cornerRadius = 10
        musicImageView.clipsToBounds = true
    }
    
    func configureDetailsLabel() {
        musicDetails.numberOfLines = 0
        musicDetails.adjustsFontSizeToFitWidth = true
        musicDetails.textAlignment = .center
    }
    
    func setImageConstraints() {
//        musicImageView.translatesAutoresizingMaskIntoConstraints = false
//        musicImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        musicImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        musicImageView.widthAnchor.constraint(equalTo: musicImageView.heightAnchor).isActive = true
//        musicImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        musicImageView.translatesAutoresizingMaskIntoConstraints = false
        musicImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        musicImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        musicImageView.widthAnchor.constraint(equalTo: musicImageView.heightAnchor).isActive = true
        musicImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func setDetailsLabelConstraints() {
//        musicDetails.translatesAutoresizingMaskIntoConstraints = false
//        musicDetails.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        musicDetails.leadingAnchor.constraint(equalTo: musicImageView.trailingAnchor, constant: 20).isActive = true
//        musicDetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        musicDetails.heightAnchor.constraint(equalToConstant: 80).isActive = true
        musicDetails.translatesAutoresizingMaskIntoConstraints = false
        musicDetails.topAnchor.constraint(equalTo: musicImageView.bottomAnchor, constant: 12).isActive = true
        musicDetails.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        musicDetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        musicDetails.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}

