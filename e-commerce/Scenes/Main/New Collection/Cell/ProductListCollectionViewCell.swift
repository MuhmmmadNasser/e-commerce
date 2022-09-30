//
//  ProductListCollectionViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 28/08/2022.
//

import UIKit

//MARK: - Protcols
protocol FavoriteButtonProtocol {
    func didTappedFavoriteButton(_ row: Int)
}

protocol CartShoppingProtocol {
    func didTappedCartShoppingButton(_ row: Int)
}

class ProductListCollectionViewCell: UICollectionViewCell {


    //MARK: - Outlets
    @IBOutlet weak var imageList: UIImageView!
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    @IBOutlet weak var cartButtonOutlet: UIButton!
    
    //MARK: - Vars
    var delegate: FavoriteButtonProtocol?
    var row: Int?
    
    var cartDelegate: CartShoppingProtocol?
    var cartRow: Int?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageList.layer.cornerRadius = 8
        cartButtonOutlet.isHidden = true
        favoriteButtonOutlet.isHidden = true
        
    }

    func setUp(image: UIImage, name: String) {
        imageList.image = image
        productNameLbl.text = name
    }
    
    //MARK: - Buttons Action
    @IBAction func didTappedFavoriteButton(_ sender: UIButton) {
        guard let row = row else { return }
        delegate?.didTappedFavoriteButton(row)
        
    }
    
    @IBAction func didTappedCartButton(_ sender: UIButton) {
        guard let cartRow = cartRow else {
            return
        }
        cartDelegate?.didTappedCartShoppingButton(cartRow)
    }
    
}
