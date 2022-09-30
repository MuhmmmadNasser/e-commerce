//
//  MyProfileViewController.swift
//  e-commerce
//
//  Created by Mohamed on 20/09/2022.
//

import UIKit
import MOLH

class MyProfileViewController: UIViewController {
   
    //MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Vars
    var index: Int = 0
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
        navigationController?.navigationBar.topItem?.title = "My Profile"
        registerTableView()
    }
    
    
    
    //MARK: - Buttons Action
    @IBAction func didTappedChangeLanguage(_ sender: UIButton) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
                MOLH.reset(transition: .transitionCrossDissolve, duration: 0.25)
    }
    
    

}
