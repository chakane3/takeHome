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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    
    // capture our categories
    func loadData() {
        meals.getCategories { (result) in
            switch result {
            case .failure( let error):
                print(error)
                
            case .success(let categories):
                self.categories = categories
            }
        }
    }
    
    
    // pass category name to MealByCategoryView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mealByCategoryVC = segue.destination as? MealByCategoryView, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector - could not get an instance")
        }
        let category = categories[indexPath.row]
        mealByCategoryVC.userSelectedCategory = category.strCategory
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

extension CategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
