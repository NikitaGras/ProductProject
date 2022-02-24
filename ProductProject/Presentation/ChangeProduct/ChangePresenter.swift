//
//  ChangePresenter.swift
//  ProductProject
//
//  Created by Nikita Gras on 19.01.2021.
//

import Foundation

class ChangePresenter: ChangeViewOutput {
    var authService: AuthService = AuthServiceImp.shared
    weak var view: ChangeViewInput!
    var product: Product!
    
    init(view: ChangeProductViewController) {
        self.view = view
    }
    
    func changeProduct(_ name: String, _ count: Double) {
        product.name = name
        product.count = count
        do {
            try product.validate()
            try authService.edit(product)
            view.back()
        } catch {
            view.show(error)
        }
    }
}
