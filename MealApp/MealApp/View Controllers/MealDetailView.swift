//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class MealDetailView: UIViewController {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealInfoTextView: UITextView!
    
    var mealID: String?
    
    var mealDetails: [MealInfo]?
    var mealIngredients: [MealIngredients?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIngredientsData()
        loadData()
    }
    
    func loadData() {
        MealDetail.getMealsDetail(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealDetails = data
                    self.updateUI()
                }
            }
        }
    }
    
    func loadIngredientsData() {
        Ingredients.getMealIngredients(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealIngredients = data
//                    dump(self.mealIngredients)
                    self.updateIngredients()
                
                }
            }
        }
    }
    
    func updateUI() {
        mealInfoTextView.text += "\nInstructions:\n\(mealDetails?[0].strInstructions ?? "no meal info")\n\n"
    }
    
    func updateIngredients() {
//        dump(mealIngredients)
        mealInfoTextView.text += "\n\nIngredients:\n\(mealIngredients)"
        
    }
}
