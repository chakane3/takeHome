//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//


import UIKit

class MealDetailView: UIViewController {
    @IBOutlet weak var mealInfoTextView: UITextView!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    var mealID: String?
    
    var mealDetails: MealInfo?
    var mealIngredients: [MealIngredients]?
    
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
                    self.mealDetails = data[0]
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
        mealInfoTextView.text += "\nInstructions:\n\(mealDetails?.strInstructions ?? "nil")"
        mealNameLabel.text = mealDetails?.strMeal
    }
    
    
    func updateIngredients() {
        mealInfoTextView.text += "\(mealIngredients![0])"
//        Ingredients.printIngredients()
    }
}
