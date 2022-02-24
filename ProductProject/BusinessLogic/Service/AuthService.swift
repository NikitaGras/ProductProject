//
//  AuthService.swift
//  ProductProject
//
//  Created by Nikita Gras on 25.01.2021.
//

import Foundation

protocol AuthService {
    var products: [Product] {get}
    
    func deleteAll() throws
    
    func delete(_ product: Product) throws
    
    func edit(_ changedProduct: Product) throws
    
    func add(_ product: Product) throws
}
