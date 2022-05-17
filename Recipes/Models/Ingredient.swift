//
//  Ingredient.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

enum IngredientType {
    // gotta figure out a better way to categorise things
    //case vegetable, fruit, meat, dairy, grain, baked_good, seafood, nut, herb, spice, garnish, oil, seasoning
    case dairy, fruit, vegetable, noodle
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
            lastBoughtAmount: Measurement(name: .gram, amount: 300.0),
            currentAmount: Measurement(name: .gram, amount: 300.0)
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
               name: "Carrot",
               type: .vegetable,
            lastBoughtAmount: Measurement(name: .number, amount: 6),
            currentAmount: Measurement(name: .number, amount: 1)
            )
        
    ]
}
