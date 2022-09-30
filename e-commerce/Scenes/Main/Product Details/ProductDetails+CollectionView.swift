//
//  ProductDetails+CollectionView.swift
//  e-commerce
//
//  Created by Mohamed on 23/09/2022.
//

import UIKit

extension ProductDetailsViewController: CollectionView_Delegate_DataSource_FlowLayout {
    
    func registerCollectionView() {
        productImageCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        productImageCollectionView.delegate = self
        productImageCollectionView.dataSource = self
        productImageCollectionView.reloadData()
        
        
        recommendedProductCollectionView.register(UINib(nibName: "ProductGrideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductGrideCollectionViewCell")
        recommendedProductCollectionView.delegate = self
        recommendedProductCollectionView.dataSource = self
        recommendedProductCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productImageCollectionView:
            return 4
        default:
            return 6
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case productImageCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.categoryNameLbl.isHidden = true
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGrideCollectionViewCell", for: indexPath) as! ProductGrideCollectionViewCell
            
            return cell
        }
    }
    
}


extension ProductDetailsViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case productImageCollectionView:
            let width = collectionView.frame.width * 0.8
            let height = (collectionView.frame.height) - 20
            
            return CGSize(width: width, height: height)
        default:
            let width = collectionView.frame.width * 0.5
            let height = (collectionView.frame.height) - 5
            
            return CGSize(width: width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
}
