//
//  ChatListViewController.swift
//  e-commerce
//
//  Created by Mohamed on 14/09/2022.
//

import UIKit

class ChatListViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    //MARK: - Vars
    var isFirstUser: Bool = true
    var messages: [MessageData] = [MessageData(text: ".", isFirstUser: true), MessageData(text: "sdsdsdf", isFirstUser: false), MessageData(text: "sdsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsf", isFirstUser: true), MessageData(text: "sdsdsdasdd asdsddsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsfdsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsfsad dasdass dsdafdfewf fewfwf f", isFirstUser: false), MessageData(text: "vvfvdv", isFirstUser: true), MessageData(text: "sdsdsdf", isFirstUser: false), MessageData(text: "sdsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsf", isFirstUser: true), MessageData(text: "sdsdsdasdd asdsddsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsfdsdsdasdasd sadas sa dsad sad asd dsaadsasdds sdadsad dsad da dasdadasd adsfsad dasdass dsdafdfewf fewfwf f", isFirstUser: false)]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

       registerTableView()
    }
    
    
    //MARK: - Buttons Action
    @IBAction func didTappedSendMessageButton(_ sender: UIButton) {
        
        guard let textFeild = messageTextField.text else { return }
        
        if textFeild != "" {
            messages.append(MessageData(text: textFeild, isFirstUser: isFirstUser))
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath.init(row: messages.count - 1, section: 0)], with: .fade)
            tableView.endUpdates()
            tableView.scrollToRow(at: IndexPath.init(row: messages.count - 1, section: 0), at: .top, animated: true)
            isFirstUser.toggle()
            messageTextField.text = ""
        }
        
    }
    
    
}

