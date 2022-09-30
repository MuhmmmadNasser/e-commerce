//
//  ProductModel.swift
//  e-commerce
//
//  Created by Mohamed on 28/09/2022.
//

import Foundation


class ProductModelArray {
    var id: Int
    var title: String
    var image: String
    var des: String
    var price: Int
    var isFavorite: Bool
    var isCart: Bool
    
    init (id: Int, title: String, image: String, des: String, price: Int, isFavorite: Bool = false, isCart: Bool = false) {
        self.id = id
        self.title = title
        self.image = image
        self.des = des
        self.price = price
        self.isFavorite = isFavorite
        self.isCart = isCart
    }
    
}
