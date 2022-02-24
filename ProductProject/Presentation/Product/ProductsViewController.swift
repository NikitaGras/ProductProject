//
//  ProductsViewController.swift
//  ProductProject
//
//  Created by Nikita Gras on 27.12.2020.
//

import UIKit
import CoreData

class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductsInput {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var listIsEmptyLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    var output: ProductsOutput!
    
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = ProductsPresenter(view: self)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        listIsEmptyLabel.isHidden = !output.products.isEmpty
        tableView.isHidden = output.products.isEmpty
        shareButton.isHidden = output.products.isEmpty
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? ProductsTableViewCell {
            cell.fill(product: output.products[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteProduct(with: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateView()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "ChangeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ChangeProductViewController, let index = selectedIndex {
            let product = output.products[index]
            vc.product = product
        }
    }
    
    @IBAction func removeAll(_ sender: Any) {
        output.deleteAll()
    }
    
    @IBAction func saveChangesUnwind(segue: UIStoryboardSegue) {}
    
    @IBAction func addProductUnwind(segue: UIStoryboardSegue) {}
    
    @IBAction func share(_ sender: Any) {
        let text = output.createListWithProducts()
        let activity = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }
}
