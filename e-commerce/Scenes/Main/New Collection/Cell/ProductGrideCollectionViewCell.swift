//
//  ProductGrideCollectionViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 28/08/2022.
//

import UIKit

class ProductGrideCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var grideView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountView: CardView!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    
    var row: Int?
    var didTappedFavoriteButtonClosure: ((_ row: Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //grideView.addLayer()
        imageView.layer.cornerRadius = 8
        //discountLabel.isHidden = true
        discountView.isHidden = true
        favoriteButtonOutlet.isHidden = true
    }
    
    func setUp(image: UIImage, name: String, type: String, price: String) {
        imageView.image = image
        productNameLbl.text = name
        descLabel.text = type
        priceLbl.text = price
    }
    
    @IBAction func didTappedFavoriteButton(_ sender: UIButton) {
        guard let row = row else {
            return
        }
        didTappedFavoriteButtonClosure?(row)
      
    }

}
