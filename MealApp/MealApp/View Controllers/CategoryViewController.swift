//
//  CategoryViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categories = [meals]() {
        didSet {
            tableView.reloadData()
            loadCategoryData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadCategoryData()
        dump(categories)
        
    }
    
    // gather our data
    func loadCategoryData() {
        
        MealAPI.fetchCategories() { [weak self] (result) in
            guard let self = self else { return }
            
            DispatchQueue.main.async { [weak self]  in
                guard let self = self else { return }
                
                switch result {
                case .failure(let networkError):
                    fatalError("network error: \(networkError)")
                    
                case .success(let data):
                    self.categories = [data]
//                    dump(self.categories)
                }
            }
        }
    }
}

// extend our view controller to conform to the tableView's datasource protocol
extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryItem", for: indexPath) as? categoryCell else {
            fatalError("could not dequeue tableView; check identify inspector")
        }
        
        let category = categories[indexPath.row]
//        category.categories[0]
        cell.configureCell(for: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
}
