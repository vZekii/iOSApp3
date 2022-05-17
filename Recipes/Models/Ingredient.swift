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
    var lastBoughtAmount: Double
    var currentAmount: Double
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
            lastBoughtAmount: 300.0,
            currentAmount: 60.0
            ),
        Ingredient(
            id: 1,
               name: "Milk",
               type: .dairy,
            lastBoughtAmount: 3.0,
            currentAmount: 1.0
            ),
        Ingredient(
            id: 2,
               name: "Carrot",
               type: .vegetable,
            lastBoughtAmount: 9.0,
            currentAmount: 8.0
            )
        
    ]
}
