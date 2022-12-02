//
//  HomeViewController+CollectionView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit

///DataSource & Deleget Protocols
extension HomeViewController: CollectionView_Delegate_DataSource_FlowLayout {
    
    func registerCollectionView() {
        collectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(categoryArray?.count)
        return categoryArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        let category = categoryArray?[indexPath.row]
        cell.categiryImageView.loadImage(urlString: category?.image ?? "")
        cell.categoryNameLbl.text = category?.name
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: "NewCollectionViewController") as! NewCollectionViewController
            //viewController.categoryName = categoryArray?[indexPath.row].id
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

///FlowLayout Protocol
extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = (collectionView.frame.height / 2) - 24
        
        //after 3 index make cellSize = width
        if indexPath.row.isMultiple(of: 3) {
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: width/2, height: height)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

