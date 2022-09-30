//
//  MyBagViewController.swift
//  e-commerce
//
//  Created by Mohamed on 20/09/2022.
//

import UIKit

class MyBagViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var CartCollectionView: UICollectionView!
    @IBOutlet weak var checkOutButtonOutlet: UIButton!
    
    
    //MARK: - Var
    var categoryName = ["T-shirts", "Crop Tops", "Sleeveless", "Blouses"]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "My Bag"
        registerCollectionView()
        checkOutButtonOutlet.addLayer()
        
    }
    
    
    
}

