//
//  ChangeProductViewController.swift
//  ProductProject
//
//  Created by Nikita Gras on 27.12.2020.
//

import UIKit
import CoreData

class ChangeProductViewController: UIViewController, ChangeViewInput {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var output: ChangeViewOutput!
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = ChangePresenter(view: self)
        output.product = product
        setupInitialState()
    }
    
    func setupStepper(with product: Product) {
        stepper.minimumValue = 0.1
        stepper.maximumValue = 1000
        stepper.stepValue = 0.1
        stepper.value = product.count.round(digitsCount: 1)
    }

    func setupInitialState() {
        guard let product = output.product else {return}
        countLabel.text = product.count.round(digitsCount: 1).description
        textField.text = product.name
        setupStepper(with: product)
    }
    
    @IBAction func countChanged(_ sender: UIStepper) {
        let count = stepper.value.round(digitsCount: 1)
        countLabel.text = count.description
    }
    
    @IBAction func save(_ sender: UIButton) {
        let name = textField.text ?? ""
        let count = stepper.value
        output.changeProduct(name, count)
    }

    func back() {
        performSegue(withIdentifier: "saveChangesUnwindWithSegue", sender: nil)
    }
    
}
