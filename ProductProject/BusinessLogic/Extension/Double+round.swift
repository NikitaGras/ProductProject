//
//  Double+round.swift
//  ProductProject
//
//  Created by Nikita Gras on 17.01.2021.
//

import Foundation

extension Double {
    func round(digitsCount count: Int) -> Double {
        let multiplyer = pow(10.0, Double(count))
        return (self * multiplyer).rounded() / multiplyer
    }
}
