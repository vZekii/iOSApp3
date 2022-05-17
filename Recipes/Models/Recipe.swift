//
//  Recipe.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import Foundation
import SwiftUI

// This was written before the data structure thing in the doc so it has to be changed.
struct Recipe: Identifiable {
    var id: Int
    var name: String
    var photos: [Image]
    var description: String
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
        Recipe(id: 1,
               name: "Spaghetti bolognese",
               photos: [Image("pasta")],
               description: "Our best ever spaghetti bolognese is super easy and a true Italian classic with a meaty, chilli sauce. This recipe comes courtesy of BBC Good Food user Andrew Balmer",
               // instead of defining all the ingredients repetively, we should generate a list that we can reference via id
               ingredients: [Ingredient(id: 1, name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0),
                            ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Put a large saucepan on a medium heat and add 1 tbsp olive oil.",
                              "Add 4 finely chopped bacon rashers and fry for 10 mins until golden and crisp.",
                              "Reduce the heat and add the 2 onions, 2 carrots, 2 celery sticks, 2 garlic cloves and the leaves from 2-3 sprigs rosemary, all finely chopped, then fry for 10 mins. Stir the veg often until it softens.",
                              "Increase the heat to medium-high, add 500g beef mince and cook stirring for 3-4 mins until the meat is browned all over.",
                              "Add 2 tins plum tomatoes, the finely chopped leaves from ¾ small pack basil, 1 tsp dried oregano, 2 bay leaves, 2 tbsp tomato purée, 1 beef stock cube, 1 deseeded and finely chopped red chilli (if using), 125ml red wine and 6 halved cherry tomatoes. Stir with a wooden spoon, breaking up the plum tomatoes.",
                              "Bring to the boil, reduce to a gentle simmer and cover with a lid. Cook for 1 hr 15 mins stirring occasionally, until you have a rich, thick sauce.",
                              "Add the 75g grated parmesan, check the seasoning and stir.",
                              "When the bolognese is nearly finished, cook 400g spaghetti following the pack instructions.",
                              "Drain the spaghetti and either stir into the bolognese sauce, or serve the sauce on top. Serve with more grated parmesan, the remaining basil leaves and crusty bread, if you like.",
                              
                             ],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
            ),
        Recipe(id: 2,
               name: "Pasta 2 electric boogaloo",
               photos: [Image("pasta")],
               description: "Yummy pasta",
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
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 4,
               name: "Pasta 4 ong",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 5,
               name: "Pasta 5: endgame",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 6,
               name: "Too much pasta",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 7,
               name: "Am I off the screen yet?",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 8,
               name: "PRaying to pasta god",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: ["Cook the pasta", "Eat the pasta"],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 9,
               name: "Surely enough pasta",
               photos: [Image("pasta")],
               description: "Yummy pasta",
               ingredients: [Ingredient(name: "pasta", type: .dairy): Measurement(name: .gram, amount: 500.0)],
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
