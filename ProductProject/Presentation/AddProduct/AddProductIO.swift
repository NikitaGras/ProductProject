//
//  AddProductIO.swift
//  ProductProject
//
//  Created by Nikita Gras on 25.01.2021.
//

import Foundation

protocol AddProductInput: class, UIViewInput {
    func back()
}

protocol AddProductOutput {
    func add(_ product: Product)
}
