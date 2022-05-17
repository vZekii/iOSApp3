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
<<<<<<< Updated upstream
        Recipe(name: "Pasta", ingredients: ["Pasta", "Water"], serves: 3, timeToMake: 20),
        Recipe(name: "Cookies", ingredients: ["sugar", "flour", "egg", "chocolate"], serves: 24, timeToMake: 60)
=======
        Recipe(id: 1,
               name: "Pasta",
               photos: [Image("pasta")],
               ingredients: [Ingredient(id: 1, name: "pasta", type: .dairy, lastBoughtAmount: 300, currentAmount: 0): Measurement(name: "grams", amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
            ),
        Recipe(id: 2,
               name: "Pasta 2 electric boogaloo",
               photos: [Image("pasta")],
               ingredients: [Ingredient(id: 1, name: "pasta", type: .dairy, lastBoughtAmount: 300, currentAmount: 300): Measurement(name: "grams", amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 3,
               name: "Pasta 3 ???????",
               photos: [Image("pasta")],
               ingredients: [Ingredient(id: 1, name: "pasta", type: .dairy, lastBoughtAmount: 300, currentAmount: 100): Measurement(name: "grams", amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              )
>>>>>>> Stashed changes
    ]
}
