//
//  CustomUIImageView.swift
//  dreamteam
//
//  Created by Holofox on 06.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomUIImageView: UIImageView {
    
    var imageUrlString: String?

    override var intrinsicContentSize: CGSize
    {
        
        let frameSizeWidth = self.frame.size.width

        guard let image = self.image else
        {
            return CGSize(width: frameSizeWidth, height: 1.0)
        }

        let returnHeight = ceil(image.size.height * (frameSizeWidth / image.size.width))
        return CGSize(width: frameSizeWidth, height: returnHeight)
    }
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
            
        }).resume()
    }
    
}
