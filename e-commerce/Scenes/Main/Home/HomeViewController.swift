//
//  HomeViewController.swift
//  e-commerce
//
//  Created by Mohamed on 27/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Vars
    var image: [UIImage] = [UIImage(named: "lunchScreen")!, UIImage(named: "category2")!, UIImage(named: "category1")!]
    var names: [String] = ["New collection", "Summer Sale", "Mean‘s hoodies"]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
}
