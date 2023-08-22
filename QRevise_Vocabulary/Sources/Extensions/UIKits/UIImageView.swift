//
//  UIImage.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 21/08/2023.
//

import UIKit

extension UIImageView {
    func getCircleImage() {
        self.layer.cornerRadius = self.frame.width / 2.0
    }
    
    func loadImageFromNetWork(url: String) {
        if let imageUrl = URL(string: url) {
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    fatalError("Cannot load image from \(imageUrl)")
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
                
            }
            task.resume()
        }
    }
}
