//
//  AuthService.swift
//  ProductProject
//
//  Created by Nikita Gras on 19.01.2021.
//

import UIKit
import CoreData

class AuthServiceImp: AuthService {
    let delegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = delegate.persistentContainer.viewContext
    
    var products: [Product] = []
    
    static let shared = AuthServiceImp()
    private init() {
        setupData()
    }

    func setupData() {
        let productsData = fetchProducts()
        for productData in productsData {
            let name = productData.name ?? "ERROR"
            let count = productData.count.round(digitsCount: 1)
            let product = Product(name: name, count: count, productData: productData)
            products.append(product)
        }
    }
    
    func fetchProducts() -> [ProductData] {
        let products = try? context.fetch(ProductData.fetchRequest())
        return products ?? []
    }
    
    func deleteAll() throws {
        var index = 0
        
        for product in products {
            if let productData = product.productData {
                context.delete(productData)
                products.remove(at: index)
            } else {
                index += 1
            }
        }
        try context.save()
        if !products.isEmpty {
            throw SystemError.custom("Некоторые продукты не удалось удалить")
        }
    }
    
    private func findIndex(product: Product, in products: [Product]) -> Int? {
        var index = 0
        guard let id = product.productData?.objectID else {
            return nil
        }
        while index < products.count && id != products[index].productData?.objectID {
            index += 1
        }
        
        if index >= products.count {
            return nil
        }
        
        return index
    }
    
    func delete(_ product: Product) throws {
        guard let index = findIndex(product: product, in: products),
              let productData = products[index].productData else {
            throw SystemError.default
        }
        context.delete(productData)
        try context.save()
        products.remove(at: index)
    }
    
    func edit(_ changedProduct: Product) throws {
        guard let index = findIndex(product: changedProduct, in: products),
              let product = products[index].productData else {
            throw SystemError.default
        }
        product.name = changedProduct.name
        product.count = changedProduct.count
        try context.save()
        
        products[index].name = changedProduct.name
        products[index].count = changedProduct.count
    }
    
    func add(_ product: Product) throws {
        let productData = ProductData(context: context)
        productData.name = product.name
        productData.count = product.count
        try context.save()
        
        var product = product
        product.productData = productData
        products.append(product)
    }
}
