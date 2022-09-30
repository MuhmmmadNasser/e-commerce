//
//  FiltersViewController.swift
//  e-commerce
//
//  Created by Mohamed on 31/08/2022.
//

import UIKit

class FiltersViewController: UIViewController {
   
    //MARK: - Outlets
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    //MARK: - Vars
    var categoryName: [String] = ["All", "Women", "Men", "Boys", "Girls"]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerColletionView()
        
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
   
    
    //MARK: - Buttons Action
    
    @IBAction func didTappedClosedBtn(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
}
