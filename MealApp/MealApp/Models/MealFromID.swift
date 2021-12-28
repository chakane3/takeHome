//
//  MealFromID.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/26/21.
//

import Foundation

struct MealDetail: Decodable {
    let meals: [MealInfo]
}

struct MealInfo: Decodable {
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
}

struct Ingredients: Decodable {
    let meals: [MealIngredients]?
}

// * seperate ingredients from measurements
// there should be an equal count of non-nil measurements and ingredients
struct MealIngredients: Decodable {
    // ingredients
    // value could be String, "", or null

    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
}

struct Measurements: Decodable {
    let meals: [MealMeasurements]
}

struct MealMeasurements: Decodable {
    // measure
    // value could be String, "", or null
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}
extension MealDetail {
    static func getMealsDetail(for categoryID: String, completionHandler: @escaping (Result<[MealInfo], Errors>) -> ()) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(categoryID)"
        
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure(networkError))
                
            case .success(let data):
                do {
                    let mealData = try JSONDecoder().decode(MealDetail.self, from: data)
                    completionHandler(.success(mealData.meals))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

extension Ingredients {
    static func getMealIngredients(for categoryID: String, completionHandler: @escaping (Result<[MealIngredients], Errors>) -> ()) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(categoryID)"
        
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure(networkError))
                
            case .success(let data):
                do {
                    let mealData = try JSONDecoder().decode(Ingredients.self, from: data)
//                    print(mealData.meals![0].strIngredient1)
                    completionHandler(.success(mealData.meals!))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func printIngredients() {
        let mealIngredients = MealIngredients.self
        let keys = ["strIngredient1", "strIngredient2", "strIngredient3", "strIngredient4", "strIngredient5", "strIngredient6", "strIngredient7", "strIngredient8", "strIngredient9", "strIngredient10", "strIngredient11", "strIngredient12", "strIngredient13", "strIngredient14", "strIngredient15", "strIngredient16", "strIngredient17", "strIngredient18", "strIngredient19", "strIngredient20"]
        let mir = Mirror(reflecting: mealIngredients)
        let properties = Array(mir.children)
        for k in keys {
            if let prop = properties.first(where: {$0.label == k}) {
                print(prop.value)
            }
        }
        
    }
}


