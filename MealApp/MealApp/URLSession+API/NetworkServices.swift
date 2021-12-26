//
//  NetworkServices.swift
//  MealApp
//
//  Created by Chakane Shegog on 12/25/21.
//

import Foundation


// heres a list of things that could potentially go wrong when making requests and decoding JSON
enum Errors: Error {
    case badURL
    case badURLResponse(Int)
    case noURLResponse
    case responseError(Error)
    case noData
    case decodingError(Error)
    
}

class NetworkRequest {
    static let shared = NetworkRequest()
    private var session: URLSession
    
    // this prevents our instace from being used outside this file
    // what we have is the shared instance of our NetworkRequest()
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func getData(from urlString: String, completionHandler: @escaping (Result<Data, Errors>) -> Void) {
        
        // create our URL for our URLSession's dataTask(with: url)
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        // perform our network request, check for errors, and gather the resources
        let dataTask = self.session.dataTask(with: url) { (data, response, error) in
            
            // no response
            if let error = error {
                completionHandler(.failure(.responseError(error)))
                return
            }
            
            // get our urlResponse then check the status code
            guard let urlResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(.noURLResponse))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299: break
            default: completionHandler(.failure(.badURLResponse(urlResponse.statusCode)))
                return
            }
            
            // check for data
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            
            completionHandler(.success(data))
        }
        dataTask.resume()
    }
}





