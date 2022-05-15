//
//  Recipe.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import Foundation

// This was written before the data structure thing in the doc so it has to be changed.
struct Recipe {
    var name: String
    var ingredients: [String] // change this to an ingredient struct with portion
    var serves: Int
    var timeToMake: Int // in minutes
}

extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(name: "Pasta", ingredients: ["Pasta", "Water"], serves: 3, timeToMake: 20),
        Recipe(name: "Cookies", ingredients: ["sugar", "flour", "egg", "chocolate"], serves: 24, timeToMake: 60)
    ]
}
