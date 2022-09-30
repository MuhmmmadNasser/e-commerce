//
//  FiltersViewController+CollectionView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit

extension FiltersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func registerColletionView() {
        
        colorCollectionView.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case colorCollectionView:
            return 12
        default:
            return categoryName.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case colorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
            cell.imageColor.image = UIImage(named: "blueColor")
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryNameLbl.text = categoryName[indexPath.row]
            return cell
        }
        
    }
   
}

extension FiltersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case colorCollectionView:
            let width = collectionView.frame.width/4
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        default:
            let width = collectionView.frame.width/3
            let height = collectionView.frame.height / 2
            return CGSize(width: width, height: height)
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
        if collectionView == colorCollectionView {
            return -25
        }else {
            return 0
        }
        
    }
}

