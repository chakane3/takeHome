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
