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
        loadData()
        
    }
    
    func loadData() {
        print("MEAL ID: \(mealID!)")
        MealDetail.getMealInstructions(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView -> MealDetail.getMealInstructions: \(error)")
                    
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
        DispatchQueue.main.async {
            self.mealInfoTextView.text += "\nInstructions:\n\(self.mealInstructions?.strInstructions ?? "nil")"
            self.mealNameLabel.text = self.mealInstructions?.strMeal
        }
    }
    
    
    
    func updateIngredients() -> [String] {
        let mir = Mirror(reflecting: mealIngredients ?? "nil")
        var strArr: [String] = []
        for child in mir.children {
            if "\(child.value)" != ""{
                strArr.append("\(child.value)\n")
            }
        }
        return strArr
    }
    
}
