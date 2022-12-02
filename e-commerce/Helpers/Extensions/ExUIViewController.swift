//
//  ExUIViewController.swift
//  e-commerce
//
//  Created by Mohamed on 06/10/2022.
//

import UIKit
import NVActivityIndicatorView


extension UIViewController:NVActivityIndicatorViewable {
    
    func showLoader() {
        let size = CGSize(width: 40, height: 40)
        startAnimating(size, message: "Loading...", type: .ballBeat)
        
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}
