//
//  ChangeViewIO.swift
//  ProductProject
//
//  Created by Nikita Gras on 25.01.2021.
//

import Foundation

protocol ChangeViewInput: class, UIViewInput {
    func back()
}

protocol ChangeViewOutput {
    var product: Product! {get set}
    func changeProduct(_ name: String, _ count: Double)
}
