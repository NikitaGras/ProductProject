//
//  ProductsIO.swift
//  ProductProject
//
//  Created by Nikita Gras on 25.01.2021.
//

import Foundation

protocol ProductsInput: class, UIViewInput {
    func updateView()
}

protocol ProductsOutput {
    var products: [Product] { get }
    
    func deleteProduct(with index: Int)
    
    func deleteAll()
    
    func createListWithProducts() -> String
}
