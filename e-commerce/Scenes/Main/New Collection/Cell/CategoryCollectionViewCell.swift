//
//  CategoryCollectionViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 31/08/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    
    
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryView.layer.borderWidth = 1
        categoryView.layer.borderColor = UIColor.gray.cgColor
        categoryView.layer.cornerRadius = 8
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }

}
