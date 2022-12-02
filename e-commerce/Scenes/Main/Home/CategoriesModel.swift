//
//  CategoriesModel.swift
//  e-commerce
//
//  Created by Mohamed on 06/10/2022.
//

import Foundation


import Foundation

// MARK: - CategoriesModel
struct CategoriesModel: Codable {
    
    let datum: [CategoryDatum]
   
    enum codingKeys: String,CodingKey {
        case datum = "data"
    }
}

// MARK: - CategoryDatum
struct CategoryDatum: Codable {
    let id: Int
    let name: String
    let image: String
}
