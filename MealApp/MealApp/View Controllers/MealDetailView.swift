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
    //    52874 no measurements, yes ingredients
    //    52878 both yes
    //    52765 loadIngredientsData found null instead of nil
    
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
    
    func updateUI() {
        mealInfoTextView.text += "Instructions:\n\(mealDetails?.strInstructions ?? "nil")\n"
        mealNameLabel.text = mealDetails?.strMeal
    }
    
    func updateIngredientsAndMeasurements() {
        let measurements = measurementsArr(for: mealMeasurements)
        let ingredients = ingredientsArr(for: mealIngredients)
        var idx = 0
        mealInfoTextView.text += "Ingredients:\n"
        mealInfoTextView.text += "\(ingredients)"
        
        DispatchQueue.main.async {
            for _ in 0...ingredients.count {
                if measurements.count > 0 {
                    if ingredients[idx] != "" {
                        self.mealInfoTextView.text += "\(measurements[idx]) \(ingredients[idx])\n"
                        idx += 1
                    }
                }
            }
        }
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
}
