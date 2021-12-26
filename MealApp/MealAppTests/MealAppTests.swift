//
//  MealAppTests.swift
//  MealAppTests
//
//  Created by Chakane Shegog on 12/25/21.
//

import XCTest
@testable import MealApp

class MealAppTests: XCTestCase {
    static let endpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"

    
    func testNetworkRequest() {
        
        // gather what we want to test
        let exp = XCTestExpectation(description: "200 OK")
        
        // make the network request
        NetworkRequest.shared.getData(from: MealAppTests.endpoint) { (result) in
            switch result {
            case .failure(let networkError):
                XCTFail("network error: \(networkError)")
                
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 10_000, "data should be bigger than 10k bytes \(data.count)")
            }
        }
        
        // timeout error
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFetchCategories() {
        let countGreaterThan = 10
        let exp = XCTestExpectation(description: "found meals")
        MealAPI.fetchCategories() { (result) in
            switch result {
            case .failure(let networkError):
                XCTFail("network error: \(networkError)")
                
            case .success(let data):
                exp.fulfill()
                print(data)
                XCTAssertGreaterThan(data.categories.count, countGreaterThan)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
}
