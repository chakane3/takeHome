//
//  CategoryViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class CategoryView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categories = [categoryInfo]() {
        didSet {
            tableView.reloadData()
            ()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        meals.getCategories { (result) in
            
            // move to main thread
            DispatchQueue.main.async {
                switch result {
                case .failure( let error):
                    print(error)
                    
                case .success(let categories):
                    self.categories = categories
                }
            }
        }
    }
}

// extend our view controller to conform to the tableView's datasource protocol
extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryItem", for: indexPath) as? categoryCell else {
            fatalError("could not dequeue tableView; check identify inspector")
        }
        
        let category = categories[indexPath.row]
        cell.configureCell(for: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
}
