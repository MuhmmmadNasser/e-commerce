//
//  MessagesViewController+TableView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit




extension MessagesViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func registerTableView() {
        tableView.register(UINib(nibName: "SingleMesssageTableViewCell", bundle: nil), forCellReuseIdentifier: "SingleMesssageTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleMesssageTableViewCell", for: indexPath) as! SingleMesssageTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sroryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = (storyboard?.instantiateViewController(identifier: "ChatListViewController")) as! ChatListViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
