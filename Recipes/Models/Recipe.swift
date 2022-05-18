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
    var ingredients: [RecipeIngredient] // change this to an ingredient struct with portion
    var timeToMake: Int // in minutes
    var servings: Int
    var difficulty: Int // 1-5
    var instructions: [String]
    var timesMade: Int
    var dietaryRequirements: [DietaryRequirements]
    var userNotes: String
}

func cookRecipe(recipe: Recipe) {
    for ingredient in recipe.ingredients {
        useIngredient(name: ingredient.ingredient, amount: ingredient.measurement.amount)
    }
}

func cookable(recipe: Recipe) -> Bool {
    for ingredient in recipe.ingredients {
        let curr = getIngredientAmountFromName(name: ingredient.ingredient)
        if (curr.amount < ingredient.measurement.amount) {
            return false
        }
    }
    return true
}

extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(id: 1,
               name: "Spaghetti bolognese",
               photos: [Image("pasta")],
               description: "Our best ever spaghetti bolognese is super easy and a true Italian classic with a meaty, chilli sauce. This recipe comes courtesy of BBC Good Food user Andrew Balmer",
               // instead of defining all the ingredients repetively, we should generate a list that we can reference via id
               ingredients: [
                    RecipeIngredient(ingredient: "Pasta", measurement: Measurement(name: .gram, amount: 500)),
                    RecipeIngredient(ingredient: "Olive Oil", measurement: Measurement(name: .mililitre, amount: 30)),
                    RecipeIngredient(ingredient: "Bacon Rasher", measurement: Measurement(name: .number, amount: 4), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Brown Onion", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Carrot", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Celery Stick", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Garlic Clove", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Rosemary Leaves", measurement: Measurement(name: .number, amount: 3), preperation: "picked and finely chopped"),
                    RecipeIngredient(ingredient: "Beef Mince", measurement: Measurement(name: .gram, amount: 500)),

               ],
               timeToMake: 120,
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
               name: "Scrambled Eggs",
               photos: [Image("scramegg")],
               description: "The easy to make egg based dinner!",
               ingredients: [
                RecipeIngredient(ingredient: "Eggs", measurement: Measurement(name: .number, amount: 5)),
                RecipeIngredient(ingredient: "Butter", measurement: Measurement(name: .gram, amount: 100)),
                RecipeIngredient(ingredient: "Salt", measurement: Measurement(name: .gram, amount: 1)),
                RecipeIngredient(ingredient: "Pepper", measurement: Measurement(name: .gram, amount: 1)),
                RecipeIngredient(ingredient: "Milk", measurement: Measurement(name: .mililitre, amount: 30)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 3,
               name: "Beef Mince Curry",
               photos: [Image("beefmince")],
               description: "Serve up some beef mince curry!",
               ingredients: [
                RecipeIngredient(ingredient: "Beef Mince", measurement: Measurement(name: .gram, amount: 500)),
                RecipeIngredient(ingredient: "Curry Powder", measurement: Measurement(name: .gram, amount: 1)),
                RecipeIngredient(ingredient: "Curry Leaves", measurement: Measurement(name: .gram, amount: 1)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 4,
               name: "Burger",
               photos: [Image("burger")],
               description: "Make a good ol' fasion burger",
               ingredients: [
                RecipeIngredient(ingredient: "Bread", measurement: Measurement(name: .gram, amount: 500)),
                RecipeIngredient(ingredient: "Cheese", measurement: Measurement(name: .gram, amount: 100)),
                RecipeIngredient(ingredient: "Beef Mince", measurement: Measurement(name: .gram, amount: 500)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 5,
               name: "Beef Noddles",
               photos: [Image("beefnoodle")],
               description: "Serve up some beef noodles!",
               ingredients: [
                RecipeIngredient(ingredient: "Noodles", measurement: Measurement(name: .gram, amount: 500)),
                RecipeIngredient(ingredient: "Beef Mince", measurement: Measurement(name: .gram, amount: 500)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 6,
               name: "Toastie",
               photos: [Image("toastie")],
               description: "The easy to make toastie!",
               ingredients: [
                RecipeIngredient(ingredient: "Bread", measurement: Measurement(name: .gram, amount: 500)),
                RecipeIngredient(ingredient: "Cheese", measurement: Measurement(name: .gram, amount: 100)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
        Recipe(id: 7,
               name: "Fruit Salad",
               photos: [Image("fruit")],
               description: "Yummy yummy",
               ingredients: [
                RecipeIngredient(ingredient: "Bananas", measurement: Measurement(name: .number, amount: 2)),
                RecipeIngredient(ingredient: "Apples", measurement: Measurement(name: .number, amount: 2)),
                RecipeIngredient(ingredient: "Oranges", measurement: Measurement(name: .number, amount: 2)),
                RecipeIngredient(ingredient: "Limes", measurement: Measurement(name: .number, amount: 2)),
               ],
               timeToMake: 20,
               servings: 5,
               difficulty: 1,
               instructions: [""],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
              ),
    ]
}
