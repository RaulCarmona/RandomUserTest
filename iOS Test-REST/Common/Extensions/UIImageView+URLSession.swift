//
//  UIImageView+URLSession.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import UIKit

extension UIImageView {
    
    func imageFromServerURL(urlString: String, placeHolderImage: UIImage?) {
        guard let urlString = URL(string: urlString) else { return }
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
    
    func roundImage() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
