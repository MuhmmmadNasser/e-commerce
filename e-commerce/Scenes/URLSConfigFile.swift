//
//  URLSConfigFile.swift
//  e-commerce
//
//  Created by Mohamed on 05/10/2022.
//

import Foundation

struct URLSConfigFile {
    
    static let baseUrl = "https://student.valuxapps.com/api"
    
    static let registerUrl = "/register"
    
    static let loginUrl = "/login"
    
    static let login = baseUrl + loginUrl
    
    static let register = baseUrl + registerUrl
    
    static let categoryUrl = "/categories"
    
    static let category = baseUrl + categoryUrl
}
