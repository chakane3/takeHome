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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    var userSelectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        DispatchQueue.main.async {
            mealFromCategory.getMealsFromCategory(for: self.userSelectedCategory ?? "beef") { (result) in
                
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.meals = data
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MealDetailVC = segue.destination as? MealDetailView, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector - could not get an instance")
        }
        let mealID = meals[indexPath.row]
        MealDetailVC.mealID = mealID.idMeal
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

extension MealByCategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
