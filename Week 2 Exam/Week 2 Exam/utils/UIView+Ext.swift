//
//  UIView+Ext.swift
//  Week 2 Exam
//
//  Created by Mauro Arantes on 24/11/2021.
//

import UIKit

extension UIView {
    
    //helper to setup AutoLayout contraints programmatically
    func pin(_ superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
