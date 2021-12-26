//
//  MealByCategoryViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class MealByCategoryView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var meals = [mealOption]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        mealFromCategory.getMealsFromCategory(for: "Beef") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.meals = data
                }
            }
        }
    }
}

extension MealByCategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as? CategoryMealCell else {
            fatalError("could not dequeue, check identity inspector")
        }
        let meal = meals[indexPath.row]
        cell.configureCell(for: meal)
        return cell
    }
}
