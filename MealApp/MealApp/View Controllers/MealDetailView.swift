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
    
    var mealInstructions: MealInstructions?
    var mealIngredients: MealIngredients?
    var mealMeasurements: MealMeasurements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIngredientsData()
        loadMeasurementsData()
        loadData()
        
    }
    
    func loadData() {
        MealDetail.getMealInstructions(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView -> MealDetail.getMealsDetail(): \(error)")
                    
                case .success(let data):
                    self.mealInstructions = data[0]
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
                    print("MealDetaiView - Ingredients.getMealIngredients(): \(error)")
                    
                case .success(let data):
                    self.mealIngredients = data[0]
//                    dump(self.mealIngredients)
                    self.updateIngredients()
                
                }
            }
        }
    }
    
    func loadMeasurementsData() {
        Measurements.getMealMeasurements(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetailView - Measurements.getMealMeasurements: \(error)")
                    
                case .success(let data):
                    self.mealMeasurements = data[0]
                    
                }
            }
        }
    }
    
    func updateUI() {
        mealInfoTextView.text += "\nInstructions:\n\(mealInstructions?.strInstructions ?? "nil")"
        mealNameLabel.text = mealInstructions?.strMeal
    }
    
    
    func updateIngredients() -> [String] {
        let mir = Mirror(reflecting: mealIngredients!)
        mealInfoTextView.text += "Ingredients:\n"
        for child in mir.children {
            mealInfoTextView.text += "\(child.value)\n"
        }
        
    }
    
}
