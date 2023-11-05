//
//  RecommendationModel.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import Foundation

struct BusinessInfo: Codable {
    let input: String
    let recommendations: [Recommendation]
}

struct Recommendation: Codable {
    let tag: String
    let score: Double
}

