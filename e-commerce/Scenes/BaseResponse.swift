//
//  BaseResponse.swift
//  e-commerce
//
//  Created by Mohamed on 06/10/2022.
//

import Foundation

// MARK: - BaseResponse
class BaseResponse<T: Codable>: Codable {
    let status: Bool
    let message: String
    let data: T?
}
