//
//  SubCategoriesCollectionViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 28/08/2022.
//

import UIKit

class SubCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryView.layer.cornerRadius = 8
    }

}
