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
struct MealIngredients: Codable {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1) ?? ""
        self.strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2) ?? ""
        self.strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3) ?? ""
        self.strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4) ?? ""
        self.strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5) ?? ""
        self.strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6) ?? ""
        self.strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7) ?? ""
        self.strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8) ?? ""
        self.strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9) ?? ""
        self.strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10) ?? ""
        self.strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11) ?? ""
        self.strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12) ?? ""
        self.strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13) ?? ""
        self.strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14) ?? ""
        self.strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15) ?? ""
        self.strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16) ?? ""
        self.strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17) ?? ""
        self.strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18) ?? ""
        self.strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19) ?? ""
        self.strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20) ?? ""
    }
}

struct Measurements: Decodable {
    let meals: [MealMeasurements]?
}

struct MealMeasurements: Codable {
    
    // measure
    // value could be String, "", or null
    var strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1) ?? ""
        self.strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2) ?? ""
        self.strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3) ?? ""
        self.strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4) ?? ""
        self.strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5) ?? ""
        self.strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6) ?? ""
        self.strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7) ?? ""
        self.strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8) ?? ""
        self.strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9) ?? ""
        self.strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10) ?? ""
        self.strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11) ?? ""
        self.strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12) ?? ""
        self.strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13) ?? ""
        self.strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14) ?? ""
        self.strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15) ?? ""
        self.strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16) ?? ""
        self.strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17) ?? ""
        self.strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18) ?? ""
        self.strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19) ?? ""
        self.strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20) ?? ""
    }
    
    init() {
        self.strMeasure1 = ""
        self.strMeasure2 = ""
        self.strMeasure3 = ""
        self.strMeasure4 = ""
        self.strMeasure5 = ""
        self.strMeasure6 = ""
        self.strMeasure7 = ""
        self.strMeasure8 = ""
        self.strMeasure9 = ""
        self.strMeasure10 = ""
        self.strMeasure11 = ""
        self.strMeasure12 = ""
        self.strMeasure13 = ""
        self.strMeasure14 = ""
        self.strMeasure15 = ""
        self.strMeasure16 = ""
        self.strMeasure17 = ""
        self.strMeasure18 = ""
        self.strMeasure19 = ""
        self.strMeasure20 = ""
    }
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
                    completionHandler(.success(mealData.meals!))
                } catch {
                    
                    // handle null json values
                    do {
                        let mealData = try JSONDecoder().decode(Ingredients.self, from: data)
                        completionHandler(.success(mealData.meals!))
                    } catch {
                        
                    }
                    
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

extension Measurements {
    static func getMealMeasurements(for categoryID: String, completionHandler: @escaping (Result<[MealMeasurements], Errors>) -> ()) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(categoryID)"
        
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completionHandler(.failure(networkError))
                
            case .success(let data):
                do {
                    let mealData = try JSONDecoder().decode(Measurements.self, from: data)
                    completionHandler(.success(mealData.meals!))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

