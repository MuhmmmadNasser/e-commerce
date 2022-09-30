//
//  MessagesViewController.swift
//  e-commerce
//
//  Created by Mohamed on 31/08/2022.
//

import UIKit

class MessagesViewController: UIViewController{

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableView()

        navigationController?.navigationBar.topItem?.title = "Messages"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(returnBackToNewCollection))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(returnBackToNewCollection))
        
    }
   
    /* //Back to myCollection page by code
    @objc func returnBackToNewCollection() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "NewCollectionViewController") as! NewCollectionViewController
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.pushViewController(viewController , animated: true)
    }
    */
    
}
