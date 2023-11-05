//
//  SharedArray.swift
//  State Farm Small Business
//
//  Created by Pramith Prasanna on 11/5/23.
//

import Foundation

class SharedArrayManager {
    static let shared = SharedArrayManager() // Create a shared instance
    
    var sharedArray: [String] = []

    private init() {
        // Initialize the array or perform any setup as needed
    }
}
