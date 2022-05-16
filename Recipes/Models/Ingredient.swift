//
//  Ingredient.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

enum IngredientType {
    case dairy, fruit, vegetable
}

struct Ingredient: Hashable {
    var name: String
    var type: IngredientType
}
