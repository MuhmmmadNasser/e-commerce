//
//  ChatListViewController+TableView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit

extension ChatListViewController: TableView_Delegate_DataSource {
    
    func registerTableView() {
        
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        if indexPath.row % 2 == 0{
            cell.stackView.alignment = .leading
            cell.messageLabel.text = "cell.stackView.alignment = .leadingcell.stackView.alignment = .leading"
        } else {
            cell.stackView.alignment = .trailing
            cell.messageLabel.text = "cell.stackView.alignment = .leadingcell.stackView.alignment = .leadingcell.stackView.alignment = .leadingcell.stackView.alignment = .leading"
        }
        return cell
 */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.updateMessageCell(by: messages[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 49
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
}

