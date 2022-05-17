//
//  Ingredient.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

enum IngredientType {
    // gotta figure out a better way to categorise things
    case vegetable, fruit, meat, dairy, grain, baked_good, seafood, nut, herb, spice, garnish, oil, seasoning
}

struct Ingredient: Hashable {
    var name: String
    var type: IngredientType
}
