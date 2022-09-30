//
//  NewCollectionViewController.swift
//  e-commerce
//
//  Created by Mohamed on 28/08/2022.
//

import UIKit


class NewCollectionViewController: UIViewController {
   
    
    //MARK: - Outlets
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var gridListBtnOutlet: UIButton!
    
    @IBOutlet weak var sortButtonOutlet: UIButton!
    @IBOutlet weak var shadowView: UIView!
    
    
    //MARK: - Variables
    var categoryName = ["T-shirts", "Crop Tops", "Sleeveless", "Blouses"]
    var image: [UIImage] = [UIImage(named: "lunchScreen")!, UIImage(named: "category2")!, UIImage(named: "category1")!, UIImage(named: "category2")!]
    
    var isListed: Bool = true
    
    var productModelArray: [ProductModelArray] = [ProductModelArray(id:1 , title: "T-shirts", image: "T-shirt", des: "T-shirt", price: 51),
        ProductModelArray(id:2, title: "Blouse", image: "Blouse", des: "Blouse", price: 51),
        ProductModelArray(id:3, title: "Shirt", image: "Shirt", des: "Shirt", price: 51),
        ProductModelArray(id:4, title: "Pullover", image: "Pullover", des: "Pullover", price: 55),
        ProductModelArray(id:1 , title: "T-shirts", image: "T-shirt", des: "T-shirt", price: 51),
        ProductModelArray(id:2, title: "Blouse", image: "Blouse", des: "Blouse", price: 51)
    ]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionViews()
        shadowView.addLayer()
        notificationObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
   
    
    //MARK: - Buttons Action
    @IBAction func gridListBtnPressed(_ sender: UIButton) {
        
        isListed.toggle()
        let imageList = UIImage(named: "list")
        let imageGrid = UIImage(named: "grid")
        let image = isListed == true ? imageGrid : imageList
        gridListBtnOutlet.setImage(image, for: .normal)
        productCollectionView.reloadData()
    }
    
    @IBAction func didTappedPriceLowestToHightBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SortByViewController") as! SortByViewController
        viewController.delegate = self
        viewController.modalPresentationStyle = .overFullScreen
        
        transtionAnimation(duration: 0.2, type: .fade)
        present(viewController, animated: false)
    }
    
    @IBAction func didTappedFiltersBtn(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FiltersViewController") as! FiltersViewController
        viewController.modalPresentationStyle = .overFullScreen
        
        transtionAnimation(duration: 0.2, type: .fade)
        present(viewController, animated: false)
    }
    
    //MARK: - Helper Functions
    func transtionAnimation(duration: CFTimeInterval, type: CATransitionType){
        let transtion = CATransition()
        transtion.duration = duration
        transtion.type = type
        view.window?.layer.add(transtion, forKey: kCATransition)
    }
    
    func notificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(favoriteNotificationCenterChanges), name: Notification.Name("didTappedFavoriteButton"), object: nil)
    }
    
    @objc
    func favoriteNotificationCenterChanges(_ notification: Notification) {
        if let id = notification.userInfo?["id"] as? Int {
            print("Product id is ", id)
            
            if let isFavorite = notification.userInfo?["isFavorite"] as? Bool {
                print("Product isFavorite is", isFavorite)
                
                productModelArray.first(where: {$0.id == id})?.isFavorite == isFavorite
                productCollectionView.reloadData()
            }
        }
        
    }
    
}

