//
//  MyFavoriteViewController.swift
//  e-commerce
//
//  Created by Mohamed on 20/09/2022.
//

import UIKit

class MyFavoriteViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    
    //MARK: - Var
    var categoryName = ["T-shirts", "Crop Tops", "Sleeveless", "Blouses"]
    var productModelArray: [ProductModelArray] = [ProductModelArray(id:1 , title: "T-shirts", image: "T-shirt", des: "T-shirt", price: 51),
        ProductModelArray(id:2, title: "Blouse", image: "Blouse", des: "Blouse", price: 51),
        ProductModelArray(id:3, title: "Shirt", image: "Shirt", des: "Shirt", price: 51),
        ProductModelArray(id:4, title: "Pullover", image: "Pullover", des: "Pullover", price: 55)]
    var isCartShoppig: Bool = false
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = "MyFavorite"
        registerCollectionView()
    }
    
    
}






