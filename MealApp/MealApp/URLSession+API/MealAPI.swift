//
//  MealAPI.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/25/21.
//

import Foundation

class MealAPI {
    static func fetchCategories(for endpoint: String, completion: @escaping (Result<meals, Errors>) -> Void) {
        
        // network request
        NetworkRequest.shared.getData(from: endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                completion(.failure(networkError))
                
            case .success(let data):
                do {
                    let results =  try JSONDecoder().decode(meals.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
    }
}
