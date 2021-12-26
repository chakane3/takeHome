//
//  categoryCell.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class categoryCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func configureCell(for meal: meals) {
        categoryLabel.text = meal.categories[0].strCategory
        categoryDescription.text = meal.categories[0].strCategoryDescription
    }
}
