//
//  Meals.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/25/21.
//

import Foundation

struct meals: Codable {
    let categories: [categoryInfo]
}

struct categoryInfo: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}


extension meals {
    static func getCategories(completionHandler: @escaping (Result<[categoryInfo], Errors>) -> ()) {
        
        // get our file using our URLSession class
        let endpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure((networkError)))
                
                
            case .success(let data):
                do {
                    let categoryData = try JSONDecoder().decode(meals.self, from: data)
                    completionHandler(.success(categoryData.categories))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}
