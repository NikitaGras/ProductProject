//
//  SystemError.swift
//  ProductProject
//
//  Created by Nikita Gras on 24.01.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case `default`
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .default:
            return "Что-то пошло не так. Попробуйте позже"
        case .custom(let message):
            return message
        }
    }
}
