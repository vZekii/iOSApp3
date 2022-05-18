//
//  IngredientDetailView.swift
//  Recipes
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation

import SwiftUI

struct ShoppingListDetailView: View {
    struct EntryRow: View {
        @State private var striked = false
        var entry: ShoppingList
        var body: some View {
            Text("\(entry.measurement.getMeasurement()) \(entry.ingredient.name) for entry \(entry.id)")
                .strikethrough(striked)
                .onTapGesture {
                    self.striked.toggle()
                    if striked {
                    ShoppingList.sampleData.remove(at: ShoppingList.sampleData.firstIndex(where: {$0.id == entry.id})!)
                        
                    let ingredientToTopUp: Int = Ingredient.sampleData.firstIndex(where: {$0.name == entry.ingredient.name}) ?? -1
                    //Tops it up in ingredients.
                    if(ingredientToTopUp != -1 ) {
                        
                        Ingredient.sampleData[ingredientToTopUp].currentAmount.amount = Ingredient.sampleData[ingredientToTopUp].lastBoughtAmount.amount
                    }
                    else {
                        let lastChecker: Ingredient = Ingredient.sampleData.last!
                        let id = (lastChecker.id + 1)
                        var holderIngredient = entry.ingredient
                        holderIngredient.id = id
                        ingAdder(ingredient: holderIngredient)
                    }
                    }
                    else {
                        
                        ShoppingList.sampleData.append(entry)
                    }
                    
                }
        }
    }
        
   
    var body: some View {
        NavigationView {
            
            List(ShoppingList.sampleData) { entry in
                EntryRow(entry: entry)
                    
            }
                    
        }
        .listStyle(.grouped)
        .navigationTitle("Shopping List")
    }
}

struct ShoppingListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
