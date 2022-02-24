//
//  ValidationError.swift
//  ProductProject
//
//  Created by Nikita Gras on 22.01.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case emptyName
    case emptyCount
    
    var errorDescription: String? {
        switch self {
        case .emptyCount:
            return "Не указано колличество!"
        case .emptyName:
            return "Не указано название!"
        }
    }
}
