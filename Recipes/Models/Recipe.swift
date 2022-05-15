//
//  Recipe.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import Foundation
import SwiftUI

// This was written before the data structure thing in the doc so it has to be changed.
struct Recipe {
    var name: String
    var photos: [Image]
    var ingredients: [Ingredient: Measurement]  // change this to an ingredient struct with portion
    var timeToMake: Int // in minutes
    var servings: Int
    var difficulty: Int // 1-5
    var instructions: [String]
    var timesMade: Int
    var dietaryRequirements: [DietaryRequirements]
    var userNotes: String
}

//extension Recipe {
//    static let sampleData: [Recipe] = [
//        Recipe(name: "Pasta", ingredients: ["Pasta", "Water"], serves: 3, timeToMake: 20),
//        Recipe(name: "Cookies", ingredients: ["sugar", "flour", "egg", "chocolate"], serves: 24, timeToMake: 60)
//    ]
//}
