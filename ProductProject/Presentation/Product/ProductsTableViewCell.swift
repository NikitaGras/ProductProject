//
//  ProductsTableViewCell.swift
//  ProductProject
//
//  Created by Nikita Gras on 27.12.2020.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func fill(product: Product) {
        nameLabel.text = product.name
        
        let count = product.count.round(digitsCount: 1)
        countLabel.text = count.description
    }
}
