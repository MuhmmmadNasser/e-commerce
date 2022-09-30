//
//  CartCollectionViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 26/09/2022.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 8
    }

}
