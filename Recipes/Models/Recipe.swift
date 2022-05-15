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

extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(name: "Pasta",
               photos: [Image("pasta")],
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: "grams", amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              )
    ]
}
