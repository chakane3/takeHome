//
//  MealsFromCategory.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import Foundation

struct mealFromCategory: Codable {
    let meals: [mealOption]
}

struct mealOption: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}


extension mealFromCategory {
    static func getMealsFromCategory(for categoryName: String, completionHandler: @escaping (Result<[mealOption], Errors>) -> ()) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categoryName)"
        
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure(networkError))
                
            case .success(let data):
                do {
                    let mealData = try JSONDecoder().decode(mealFromCategory.self, from: data)
                    completionHandler(.success(mealData.meals))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
