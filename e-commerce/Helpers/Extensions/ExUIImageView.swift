//
//  ExUIImageView.swift
//  e-commerce
//
//  Created by Mohamed on 06/10/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(urlString: String, defualtImage: String = "lunchScreen") {
        guard let url = URL(string: urlString) else { return }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString )
        var kf = self.kf
        kf.indicatorType = .activity
        let defaultImage = UIImage(named: defualtImage)
        self.kf.setImage(with: resource, placeholder: defualtImage as! Placeholder )
    }
    
}
