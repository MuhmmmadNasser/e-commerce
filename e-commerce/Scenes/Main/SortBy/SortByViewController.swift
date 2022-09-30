//
//  SortByViewController.swift
//  e-commerce
//
//  Created by Mohamed on 31/08/2022.
//

import UIKit


protocol SortDelegate: AnyObject {
    func sortChangedTitle(title: String)
}


class SortByViewController: UIViewController {

   //MARK: - Outlets
    @IBOutlet var listViews: [UIView]!
    @IBOutlet var listLables: [UILabel]!
    
    
    //MARK: - Vars
    var delegate: SortDelegate?
    var sortArray: [String] = ["Populer", "Newest", "Customer review","Price: Highest to low"]
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listViews.first?.backgroundColor = .red
        listLables.first?.textColor = .white
        
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    
    //MARK: - Action Buttons
    @IBAction func didTappedCloseedBtn(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func didTappedListButton(_ sender: UIButton) {
        print("Sender tagis", sender.tag)
        
        let title = sortArray[sender.tag]
        delegate?.sortChangedTitle(title: title)
        
        //modify background view && lable textcolor
        listViews.forEach({$0.backgroundColor = .white})
        listViews.first(where: {$0.tag == sender.tag})?.backgroundColor = .red
        
        for rowLable in listLables {
            if rowLable.tag == sender.tag {
                rowLable.textColor = .white
            } else {
                rowLable.textColor = .black
            }
            
        }
    }
    
}
