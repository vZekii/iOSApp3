//
//  RecipeIngredient.swift
//  Recipes
//
//  Created by Zach Clare on 18/5/2022.
//

import Foundation

struct RecipeIngredient: Hashable {
    var ingredient: Ingredient
    var measurement: Measurement
    var preperation: String  // stuff like finely chopped, crushed, etc
}
