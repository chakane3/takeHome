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
                    self.updateIngredientsAndMeasurements()
                    
                }
            }
        }
    }
    
    func loadMeasureData() {
        print(mealID)
        Measurements.getMealMeasurements(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealMeasurements = data[0]
                }
            }
        }
    }
    
    func updateUI() {
        mealInfoTextView.text += "Instructions:\n\(mealDetails?.strInstructions ?? "nil")\n"
        mealNameLabel.text = mealDetails?.strMeal
    }
    
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
    
    
    func updateIngredientsAndMeasurements() {
        let measurements = measurementsArr(for: mealMeasurements)
        let ingredients = ingredientsArr(for: mealIngredients)
        var idx = 0
        mealInfoTextView.text += "Ingredients:\n"
        print(measurements)
        print()
        print(ingredients)
//        for _ in 0...measurements.count {
//            mealInfoTextView.text += "\(ingredients[idx]) \(measurements[idx])"
//            idx += 1
//        }
    }
}
