//
//  RecommendationModel.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import Foundation

struct PolicyResponse: Codable {
    let policies: [Policy]
}

struct Policy: Codable {
    let score: Double
    let tag: String
}

func fetchPoliciesFromAPI(completion: @escaping (PolicyResponse?, Error?) -> Void) {
    // Define the URL for the API endpoint
    if let url = URL(string: "http://localhost:5000/getmatches") {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let policyResponse = try decoder.decode(PolicyResponse.self, from: data)
                    completion(policyResponse, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    } else {
        let invalidURLError = NSError(domain: "YourApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        completion(nil, invalidURLError)
    }
}

