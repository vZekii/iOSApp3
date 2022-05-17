//
//  ShoppingLIst.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation

struct ShoppingList: Identifiable, Hashable{
    var id: Int
    var ingredient: Ingredient
    var measurement: Measurement
}


extension ShoppingList {
    static var sampleData: [ShoppingList] = [
        ShoppingList(
            id: 1,
            ingredient: Ingredient( id: 1, name: "Pasta", type: .noodle, lastBoughtAmount: 300.0, currentAmount: 60.0),
            measurement: Measurement(name: .gram, amount: 500.0)
            ),
        ShoppingList(
            id: 2,
            ingredient: Ingredient( id: 1, name: "Milk", type: .noodle, lastBoughtAmount: 300.0, currentAmount: 60.0),
            measurement: Measurement(name: .litre, amount: 300.0)
            ),
        ShoppingList(
            id: 3,
            ingredient: Ingredient( id: 1, name: "Carrots", type: .vegetable, lastBoughtAmount: 9.0, currentAmount: 6.0),
            measurement: Measurement(name: .gram, amount: 9.0)
            )
        
    ]
}
