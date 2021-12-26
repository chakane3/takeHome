//
//  CategoryMealCell.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class CategoryMealCell: UITableViewCell {
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    func configureCell(for meal: mealOption) {
        mealNameLabel.text = meal.strMeal
        
        // TODO: add image handler
    }
    
}
