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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        updateUI()
        dump(mealDetails)
    }
    
    func loadData() {
        MealDetail.getMealsDetail(for: mealID ?? "nil") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("MealDetaiView: \(error)")
                    
                case .success(let data):
                    self.mealDetails = data
                }
            }
        }
    }
    
    func updateUI() {
        
    }
}
