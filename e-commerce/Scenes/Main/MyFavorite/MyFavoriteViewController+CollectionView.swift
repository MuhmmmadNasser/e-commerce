//
//  MyFavoriteViewController+CollectionView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit


//MARK: - Ectension Protocols
extension MyFavoriteViewController: CartShoppingProtocol {
    func didTappedCartShoppingButton(_ row: Int) {
        var isCart = productModelArray[row].isCart
        print(isCart, row)
        productModelArray[row].isCart = !isCart
        productCollectionView.reloadData()
        
    }
}

//MARK: - Extension CollectionView
///DataSource && Delegate
extension MyFavoriteViewController: CollectionView_Delegate_DataSource_FlowLayout{
    
    func registerCollectionView() {
        
        ///subCategoriesCollectionView
        subCategoriesCollectionView.register(UINib(nibName: "SubCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoriesCollectionViewCell")
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        subCategoriesCollectionView.reloadData()
        
        ///productCollectionView
        productCollectionView.register(UINib(nibName: "ProductListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductListCollectionViewCell")
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case subCategoriesCollectionView:
            return productModelArray.count
        default:
            return productModelArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoriesCollectionViewCell", for: indexPath) as! SubCategoriesCollectionViewCell
            cell.categoryNameLbl.text = categoryName[indexPath.row]
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCollectionViewCell", for: indexPath) as! ProductListCollectionViewCell
            
            cell.cartButtonOutlet.isHidden = false
            cell.cartRow = indexPath.row
            cell.cartDelegate = self
            
            let model = productModelArray[indexPath.row]
            
            let image = model.isCart == true ? UIImage(named: "cart") : UIImage(named: "shopping-bag")
            cell.cartButtonOutlet.setImage(image, for: .normal)
            
        return cell
        }
       
    }
}

///FlowLayout
extension MyFavoriteViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let width = collectionView.frame.width - 24
            let height = collectionView.frame.height
            return CGSize(width: width / 3, height: height)
        default:
            
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            return CGSize(width: width , height: height / 4)
            
        }
    }
    
}
