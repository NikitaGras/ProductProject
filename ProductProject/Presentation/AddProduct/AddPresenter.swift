//
//  AddPresenter.swift
//  ProductProject
//
//  Created by Nikita Gras on 20.01.2021.
//

import UIKit

class AddPresenter: AddProductOutput {
    
    let authService: AuthService = AuthServiceImp.shared
    weak var view: AddProductInput!
    
    init(view: AddProductViewController) {
        self.view = view
    }

    func add(_ product: Product) {
        do {
            try product.validate()
            try authService.add(product)
            view.back()
        } catch {
            view.show(error)
        }
    }
}
