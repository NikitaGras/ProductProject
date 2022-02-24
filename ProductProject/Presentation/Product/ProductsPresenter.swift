//
//  ProductsPresenter.swift
//  ProductProject
//
//  Created by Nikita Gras on 20.01.2021.
//

import UIKit

class ProductsPresenter: ProductsOutput {
    var authService: AuthService = AuthServiceImp.shared
    weak var view: ProductsInput!
    
    var products: [Product] {
        return authService.products
    }
    
    init (view: ProductsViewController) {
        self.view = view
    }
    
    func deleteProduct(with index: Int) {
        do {
            try authService.delete(products[index])
        } catch {
            view.show(error)
        }
    }
    
    func deleteAll() {
        do {
            try authService.deleteAll()
            view.updateView()
        } catch {
            view.show(error)
            view.updateView()
        }
    }
    
    func createListWithProducts() -> String {
        var text = ""
        for index in 0..<products.count {
            let name = products[index].name
            let count = products[index].count.round(digitsCount: 1)
            text += "\(index+1)) \(name) - \(count) \n"
        }
        return text
    }
}
