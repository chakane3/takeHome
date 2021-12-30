//
//  categoryCell.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import UIKit

class categoryCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // empty out the image view
        categoryImageView.image = nil
    }
    
    func configureCell(for category: categoryInfo) {
        categoryLabel.text = category.strCategory
        
        // image handler
        categoryImageView.getImage(with: category.strCategoryThumb) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.categoryImageView.image = UIImage(systemName: "exclamationmark.triangle")
                }
                
            case .success(let image):
                DispatchQueue.main.async {
                    self?.categoryImageView.image = image
                }
            }
        }
    }
    
}
