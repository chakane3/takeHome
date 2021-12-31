//
//  UIImageViewExtension.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/29/21.
//

import UIKit
import Foundation

// this an extension to use our NetworkRequest so we can get back an image
extension UIImageView {
    func getImage(with url: String, completion: @escaping (Result<UIImage, Errors>) -> ()) {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.center = center
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
        
        
        NetworkRequest.shared.getData(from: url) { [weak activityIndicator] (result) in
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
            }
            
            switch result {
            case .failure(_):
                completion(.failure(.badURL))
                
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
        }
    }
}


