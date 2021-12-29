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
        loadData()
        loadIngredientsData()
        loadMeasureData()
    }
}


 // MARK: - functions to gather data for UI
extension MealDetailView {
    func loadData() {
        MealDetail.getMealsDetail(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView - getMealsDetail: \(error)")
                    
                case .success(let data):
                    self.mealDetails = data[0]
                    self.updateUI()
                }
            }
        }
    }
    
    func loadIngredientsData() {
        print(mealID)
        Ingredients.getMealIngredients(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView - loadIngredientsData: \(error)")
                    
                case .success(let data):
                    self.mealIngredients = data[0]
                    self.updateIngredientsAndMeasurements()
                }
            }
        }
    }
    
    func loadMeasureData() {
        Measurements.getMealMeasurements(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView - loadIngredientsData: \(error)")
                    
                case .success(let data):
                    self.mealMeasurements = data[0]
                }
            }
        }
    }
}


// MARK: - functions to update UI
extension MealDetailView {
    func updateUI() {
        DispatchQueue.main.async {
            self.mealInfoTextView.text += "Instructions:\n\(self.mealDetails?.strInstructions ?? "nil")\n\n"
            self.mealNameLabel.text = self.mealDetails?.strMeal
        }
    }
    
    func updateIngredientsAndMeasurements() {
        let measurements = measurementsArr(for: mealMeasurements)
        let ingredients = ingredientsArr(for: mealIngredients)
        var idx = 0
        mealInfoTextView.text += "Ingredients:\n"
        DispatchQueue.main.async {
            for _ in 0...ingredients.count {
                if measurements.count > 0 {
                    if ingredients[idx] != "" {
                        self.mealInfoTextView.text += "\(measurements[idx]) \(ingredients[idx])\n"
                        idx += 1
                    }
                }
            }
            self.mealInfoTextView.text += "\n"
        }
    }
}


// MARK: - functions to return ingredients and measurements as an array of type String
extension MealDetailView {
    func measurementsArr(for measurements: MealMeasurements?) -> [String] {
        let mir = Mirror(reflecting: mealMeasurements ?? "nil")
        var strArr: [String] = []
        for val in mir.children {
            strArr.append("\(val.value)")
        }
        return strArr
    }
    
    func ingredientsArr(for ingredients: MealIngredients?) -> [String] {
        let mir = Mirror(reflecting: mealIngredients ?? "nil")
        var strArr: [String] = []
        for val in mir.children {
            strArr.append("\(val.value)")
        }
        return strArr
    }
}


// 52940: [√] Instruction; [X] Ingredients w/ measure <- JSON had non-nil
// 53016: [√] Instructions; [√] Ingredients w/ measure
// 52765: [√] Instruction; [X] Ingredients w/ measure <- JSON has null

