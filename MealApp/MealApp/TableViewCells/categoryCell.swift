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
    
    func configureCell(for category: categoryInfo) {
        categoryLabel.text = category.strCategory
        categoryDescription.text = category.strCategoryDescription
        
        // TODO: add image handler
    }

}
