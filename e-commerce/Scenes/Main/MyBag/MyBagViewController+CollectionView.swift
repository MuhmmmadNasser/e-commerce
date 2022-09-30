//
//  MyBagViewController+CollectionView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit


//MARK: - Extension CollectionView
extension MyBagViewController: CollectionView_Delegate_DataSource_FlowLayout{
    
    func registerCollectionView() {
        subCategoriesCollectionView.register(UINib(nibName: "SubCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoriesCollectionViewCell")
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        subCategoriesCollectionView.reloadData()
        
        CartCollectionView.register(UINib(nibName: "CartCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CartCollectionViewCell")
        CartCollectionView.delegate = self
        CartCollectionView.dataSource = self
        CartCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case subCategoriesCollectionView:
            return categoryName.count
        default:
            return categoryName.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoriesCollectionViewCell", for: indexPath) as! SubCategoriesCollectionViewCell
            cell.categoryNameLbl.text = categoryName[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
            return cell
        }
        
    }
}

extension MyBagViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let width = collectionView.frame.width - 24
            let height = collectionView.frame.height
            return CGSize(width: width / 3, height: height)
        default:
            
            
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            return CGSize(width: width , height: 140  )
            
            
        }
    }
}

