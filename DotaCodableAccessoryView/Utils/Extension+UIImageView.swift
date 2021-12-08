//
//  Extension+UIImageView.swift
//  DotaCodable
//
//  Created by Mauro Arantes on 01/12/2021.
//

import UIKit

extension UIImageView {
    func getImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        let session = URLSession.shared
        let task = session.dataTask(with: url) {data, response, error in
            guard let httpURLReponse = response as? HTTPURLResponse, httpURLReponse.statusCode == 200 else {return}
            guard let mimeType = response?.mimeType, mimeType.hasPrefix("image") else {return}
            guard let data = data, error == nil else {return}
            guard let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
