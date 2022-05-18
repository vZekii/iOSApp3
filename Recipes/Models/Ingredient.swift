//
//  Ingredient.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

enum IngredientType {
    // gotta figure out a better way to categorise things
    case vegetable, fruit, meat, dairy, grain, baked_good, seafood, nut, herb, spice, garnish, oil, seasoning, noodle, misc  // extended
}

//struct Ingredient: Hashable {
//    var name: String
//    var type: IngredientType
//
//}

struct Ingredient: Hashable, Identifiable{
    var id: Int
    var name: String
    var type: IngredientType
    var lastBoughtAmount: Measurement
    var currentAmount: Measurement
}

func ingAdder (ingredient: Ingredient) {
    Ingredient.sampleData.append(ingredient)
}

extension Ingredient {
    static var sampleData: [Ingredient] = [
        Ingredient(
            id: 0,
            name: "Pasta",
            type: .noodle,
            lastBoughtAmount: Measurement(name: .gram, amount: 800.0),
            currentAmount: Measurement(name: .gram, amount: 800.0)
        ),
        Ingredient(
            id: 1,
            name: "Milk",
            type: .dairy,
            lastBoughtAmount: Measurement(name: .gram, amount: 3),
            currentAmount: Measurement(name: .litre, amount: 5)
        ),
        Ingredient(
            id: 2,
            name: "Potato",
            type: .vegetable,
            lastBoughtAmount: Measurement(name: .number, amount: 6),
            currentAmount: Measurement(name: .number, amount: 1)
        ),
        
        // for spaghetti demonstation
        Ingredient(
            id: 3,
            name: "Olive Oil",
            type: .oil,
            lastBoughtAmount: Measurement(name: .mililitre, amount: 1000),
            currentAmount: Measurement(name: .mililitre, amount: 1000)
        ),
        Ingredient(
            id: 4,
            name: "Bacon rasher",
            type: .meat,
            lastBoughtAmount: Measurement(name: .number, amount: 16),
            currentAmount: Measurement(name: .number, amount: 16)
        ),
        Ingredient(
            id: 5,
            name: "Brown Onion",
            type: .vegetable,
            lastBoughtAmount: Measurement(name: .number, amount: 5),
            currentAmount: Measurement(name: .number, amount: 5)
        ),
        Ingredient(
            id: 6,
            name: "Carrot",
            type: .vegetable,
            lastBoughtAmount: Measurement(name: .number, amount: 6),
            currentAmount: Measurement(name: .number, amount: 6)
        ),
        Ingredient(
            id: 7,
            name: "Celery Stick",
            type: .vegetable,
            lastBoughtAmount: Measurement(name: .number, amount: 15),
            currentAmount: Measurement(name: .number, amount: 15)
        ),
        Ingredient(
            id: 8,
            name: "Galic Clove",
            type: .spice,
            lastBoughtAmount: Measurement(name: .number, amount: 20),
            currentAmount: Measurement(name: .number, amount: 20)
        ),
        Ingredient(
            id: 9,
            name: "Rosemary Leaves",
            type: .garnish,
            lastBoughtAmount: Measurement(name: .number, amount: 20),
            currentAmount: Measurement(name: .number, amount: 20)
        ),
        Ingredient(
            id: 10,
            name: "Beef Mince",
            type: .meat,
            lastBoughtAmount: Measurement(name: .gram, amount: 2000),
            currentAmount: Measurement(name: .gram, amount: 2000)
        ),
    ]
    
    
}
