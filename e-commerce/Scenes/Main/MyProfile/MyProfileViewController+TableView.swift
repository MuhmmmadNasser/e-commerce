//
//  MyProfileViewController+TableView.swift
//  e-commerce
//
//  Created by Mohamed on 29/09/2022.
//

import UIKit



extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
           
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Text Label"
        cell.detailTextLabel?.text = "detailTextLabel"
        
        return cell
    }
}
