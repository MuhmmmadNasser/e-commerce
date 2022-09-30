//
//  NewCollectionVC+TableView.swift
//  e-commerce
//
//  Created by Mohamed on 23/09/2022.
//

import UIKit

//MARK: - Protocol Extension
extension NewCollectionViewController: SortDelegate {
    func sortChangedTitle(title: String) {
        sortButtonOutlet.setTitle(title, for: .normal)
    }
    
}

extension NewCollectionViewController: FavoriteButtonProtocol {
    func didTappedFavoriteButton(_ row: Int) {
        var isFavorite = productModelArray[row].isFavorite
        print(isFavorite, row)
        productModelArray[row].isFavorite = !isFavorite
        
        productCollectionView.reloadData()
       
    }
   
}


//MARK: - NewCollectionViewController
extension NewCollectionViewController: CollectionView_Delegate_DataSource_FlowLayout {
    
    func registerCollectionViews() {
        subCategoriesCollectionView.register(UINib(nibName: "SubCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoriesCollectionViewCell")
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        
        productCollectionView.register(UINib(nibName: "ProductListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductListCollectionViewCell")
        productCollectionView.register(UINib(nibName: "ProductGrideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductGrideCollectionViewCell")
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subCategoriesCollectionView{
            return categoryName.count
        } else if collectionView == productCollectionView {
            return productModelArray.count
        } else {
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
            if isListed == true {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCollectionViewCell", for: indexPath) as! ProductListCollectionViewCell
                
                cell.favoriteButtonOutlet.isHidden = false
                
                let model = productModelArray[indexPath.row]
                  
                cell.productNameLbl.text = model.title
                cell.productPriceLbl.text = "$ \(model.price)"
                cell.imageList.image = UIImage(named: model.image)
                cell.descLabel.text = model.des
                
                cell.delegate = self
                cell.row = indexPath.row
                
                let image = model.isFavorite == true ? UIImage(named: "favorite") : UIImage(named: "unFavorite")
                cell.favoriteButtonOutlet.setImage(image, for: .normal)
                //cell.setUp(image: image[indexPath.row], name: categoryName[indexPath.row])
                return cell
            }else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductGrideCollectionViewCell", for: indexPath) as! ProductGrideCollectionViewCell
                
                cell.favoriteButtonOutlet.isHidden = false
                
                let model = productModelArray[indexPath.row]
                
                cell.productNameLbl.text = model.title
                cell.priceLbl.text = "$ \(model.price)"
                cell.imageView.image = UIImage(named: model.image)
                cell.descLabel.text = model.des
                
                cell.row = indexPath.row
                
                let image = model.isFavorite == true ? UIImage(named: "favorite") : UIImage(named: "unFavorite")
                cell.favoriteButtonOutlet.setImage(image, for: .normal)
                cell.didTappedFavoriteButtonClosure = { [weak self] row in
                    guard let self = self else {
                        return
                    }
                    var isFavorite = self.productModelArray[row].isFavorite
                    print(isFavorite, row)
                    self.productModelArray[row].isFavorite = !isFavorite
                    self.productCollectionView.reloadData()
                }
              
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = productModelArray[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
        viewController.product = product
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


extension NewCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let width = collectionView.frame.width - 24
            let height = collectionView.frame.height
            return CGSize(width: width / 3, height: height)
        default:
            if isListed {
                let width = collectionView.frame.width
                let height = collectionView.frame.height
                return CGSize(width: width , height: 150 /*height / 4*/)
            } else {
                let width = collectionView.frame.width
                let height = collectionView.frame.height
                
                return CGSize(width: width / 2, height: 234/*height / 2*/)
            }
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

