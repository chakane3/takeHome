//
//  DetailCell.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class DetailCell: UITableViewCell {
    @IBOutlet weak var mealTextView: UITextView!
    
    
    
    func configureCell(for meal: MealInfo) {
        mealTextView.text = "Meal \n\(meal.strInstructions)" 
    }
    

}
