//
//  AddProductViewController.swift
//  ProductProject
//
//  Created by Nikita Gras on 27.12.2020.
//

import UIKit
import CoreData

class AddProductViewController: UIViewController, AddProductInput {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var output: AddProductOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = AddPresenter(view: self)
        setupInitialState()
    }
    
    func setupInitialState() {
        setupStepper()
        updateCountLabel(with: stepper)
    }
    
    @IBAction func countChanged(_ sender: UIStepper) {
        updateCountLabel(with: stepper)
    }
    
    @IBAction func add(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let count = stepper.value
        let product = Product(name: name, count: count)
        output.add(product)
    }
    
    func back() {
        performSegue(withIdentifier: "addProductUnwind", sender: nil)
    }
    
    func setupStepper() {
        stepper.minimumValue = 0.1
        stepper.maximumValue = 1000
        stepper.stepValue = 0.1
    }
    
    func updateCountLabel(with stepper: UIStepper) {
        let count = stepper.value.round(digitsCount: 1)
        countLabel.text = count.description
    }
    
}
