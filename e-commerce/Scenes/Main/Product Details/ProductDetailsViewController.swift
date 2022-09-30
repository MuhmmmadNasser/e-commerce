//
//  ProductCardViewController.swift
//  e-commerce
//
//  Created by Mohamed on 07/09/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var productImageCollectionView: UICollectionView!
    @IBOutlet weak var recommendedProductCollectionView: UICollectionView!
    
    @IBOutlet weak var addToCardBtnOutlet: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Vars
    var product: ProductModelArray?
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = product?.title
        navigationController?.navigationBar.prefersLargeTitles = false
        
        registerCollectionView()
        addToCardBtnOutlet.addLayer()
        changeFavoriteButtonImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    //MARK: - Buttons Action
    @IBAction func didTappedFavoriteButton(_ sender: Any) {
        let isFavorite = product?.isFavorite
        product?.isFavorite.toggle()
        changeFavoriteButtonImage()
        
        let userInfo: [String : Any] = ["id": product?.id, "isFavorite": product?.isFavorite ]
        NotificationCenter.default.post(name: Notification.Name("didTappedFavoriteButton"), object: nil, userInfo: userInfo)
        
    }
    
    //MARK: - Helper Function
    func changeFavoriteButtonImage() {
        let image = product?.isFavorite == true ? UIImage(named: "favorite") : UIImage(named: "unFavorite")
        favoriteButton.setImage(image, for: .normal)
    }
   
}


