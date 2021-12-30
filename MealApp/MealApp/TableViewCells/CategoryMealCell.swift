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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // empty out the image view
        mealImageView.image = nil
    }
    
    func configureCell(for meal: mealOption) {
        mealNameLabel.text = meal.strMeal
        
        // image handler
        mealImageView.getImage(with: meal.strMealThumb) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.mealImageView.image = UIImage(systemName: "exclamationmark.triangle")
                }
                
            case .success(let image):
                DispatchQueue.main.async {
                    self?.mealImageView.image = image
                }
            }
        }
        
    }
    
}
