//  MealDetailViewController.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//


import UIKit

class MealDetailView: UIViewController {
    @IBOutlet weak var mealInfoTextView: UITextView!
    
    var mealID: String?
    var mealDetails: MealInfo?
    var mealIngredients: MealIngredients?
    var mealMeasurements: MealMeasurements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInstructionsData()
        loadMeasureData()
        loadIngredientsData()
    }
}


// MARK: - functions to gather data
extension MealDetailView {
    func loadInstructionsData() {
        MealDetail.getMealsDetail(for: mealID ?? "nil") { (result) in
            switch result {
            case .failure(let error):
                print("MealDetaiView - getMealsDetail: \(error)")
                
            case .success(let data):
                self.mealDetails = data[0]
                self.updateInstructions()
            }
        }
    }
    
    func loadIngredientsData() {
        Ingredients.getMealIngredients(for: mealID ?? "nil")  { (result) in
            switch result {
            case .failure(let error):
                print("MealDetaiView - loadIngredientsData: \(error)")
                
            case .success(let data):
                self.mealIngredients = data[0]
                self.updateIngredientsAndMeasurements()
            }
        }
    }
    
    func loadMeasureData() {
        Measurements.getMealMeasurements(for: mealID ?? "nil") { (result) in
            switch result {
            case .failure(let error):
                print("MealDetaiView - loadIngredientsData: \(error)")
                
            case .success(let data):
                    self.mealMeasurements = data[0]
            }
        }
    }
}


// MARK: - functions to update UI
extension MealDetailView {
    func updateInstructions() {
        DispatchQueue.main.async {
            self.mealInfoTextView.text += "Instructions:\n\(self.mealDetails?.strInstructions ?? "nil")\n\n"
            self.navigationItem.title = self.mealDetails?.strMeal
        }
    }
    
    func updateIngredientsAndMeasurements() {
        let measurements = measurementsArr(for: mealMeasurements)
        let ingredients = ingredientsArr(for: mealIngredients)
        var idx = 0
        DispatchQueue.main.async {
            self.mealInfoTextView.text += "Ingredients:\n"
            for _ in 0...ingredients.count-1 {
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
