//
//  showAlertExtension.swift
//  ProductProject
//
//  Created by Nikita Gras on 11.01.2021.
//

import UIKit

protocol UIViewInput {
    func show(_ error: Error)
    func showAlert(title: String, message: String)
}

extension UIViewInput {
    func show(_ error: Error) {
        showAlert(title: "Ошибка", message: error.localizedDescription)
    }
    
    func showAlert(title: String, message: String) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
