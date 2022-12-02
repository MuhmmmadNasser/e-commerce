//
//  LoginModel.swift
//  e-commerce
//
//  Created by Mohamed on 06/10/2022.
//

import Foundation


// MARK: - LoginModel
struct LoginModel: Codable {
    let id: Int
    let name, email, phone: String
    let image: String
    let points, credit: Int
    let token: String
}
