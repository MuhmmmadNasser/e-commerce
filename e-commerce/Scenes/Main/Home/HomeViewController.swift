//
//  HomeViewController.swift
//  e-commerce
//
//  Created by Mohamed on 27/08/2022.
//

import UIKit
import Alamofire


class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoryArray: [CategoryDatum]?
    
    //MARK: - Vars
//    var image: [UIImage] = [UIImage(named: "lunchScreen")!, UIImage(named: "category2")!, UIImage(named: "category1")!]
//    var names: [String] = ["New collection", "Summer Sale", "Mean‘s hoodies"]
//    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        getCategories()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)

    }

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func getCategories() {
        guard let url = URL(string: "https://student.valuxapps.com/api/categories") else { return }
        showLoader()
        let headers: HTTPHeaders = [.init(name: "lang", value: "ar")]
        AF.request(url, method: .get, headers: headers).responseDecodable(of: BaseResponse<CategoriesModel>.self) {[weak self] response in
            guard let self = self else { return }
            defer {
                self.hideLoader()
            }
            switch response.result {
            case .success(let categories):
                self.categoryArray = categories.data?.datum
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
