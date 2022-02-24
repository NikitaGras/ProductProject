//
//  Product.swift
//  ProductProject
//
//  Created by Nikita Gras on 27.12.2020.
//

import Foundation

struct Product {
    var name: String
    var count: Double
    var productData: ProductData?

    func validate() throws {
        if name.isEmpty {
            throw ValidationError.emptyName
        }
        if count <= 0 {
            throw ValidationError.emptyCount
        }
    }
}
