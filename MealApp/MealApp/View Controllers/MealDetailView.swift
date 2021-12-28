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
    var mealIngredients: MealIngredients?
    var mealMeasurements: MealMeasurements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIngredientsData()
        loadMeasureData()
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
                    self.mealIngredients = data[0]
//                    dump(self.mealIngredients)
                    self.updateIngredients()
                
                }
            }
        }
    }
    
    func loadMeasureData() {
        Measurements.getMealMeasurements(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealMeasurements = data[0]
                    self.updateMealMeasurements()
                }
            }
        }
    }
    
    func updateUI() {
        mealInfoTextView.text += "Instructions:\n\(mealDetails?.strInstructions ?? "nil")\n"
        mealNameLabel.text = mealDetails?.strMeal
    }
    func updateMealMeasurements() {
        let mir = Mirror(reflecting: mealMeasurements ?? "nil")
        mealInfoTextView.text += "Measurements:\n"
        for val in mir.children {
            mealInfoTextView.text += "\(val.value)\n"
        }
    }
    
    
    func updateIngredients() {
        let mir = Mirror(reflecting: mealIngredients ?? "nil")

        var idx = 0
        mealInfoTextView.text += "Ingredients:\n"
        for val in mir.children {
            mealInfoTextView.text += "\(val.value)\n"
            idx += 1
        }
    }
}
