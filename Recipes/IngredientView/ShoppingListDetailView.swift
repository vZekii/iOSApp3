//
//  IngredientDetailView.swift
//  Recipes
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation

import SwiftUI

struct ShoppingListDetailView: View {
    struct EntryRow: View {
        //state checks if the value has been striked to action the code accordingly
        @State private var striked = false
        var entry: ShoppingList
        var body: some View {
            //shows the entry
            Text("\(entry.measurement.getMeasurement()) \(entry.ingredient.name)")
                .strikethrough(striked)
                //adds a strike through if it is tapped
                .onTapGesture {
                    //once it is tapped it changes the striked bool
                    self.striked.toggle()
                    //runs code if a strike is through the item
                    if striked {
                        //removes the item from the shoppinglist array
                        ShoppingList.sampleData.remove(at: ShoppingList.sampleData.firstIndex(where: {$0.id == entry.id})!)
                            //checks if the ingredient is in the list
                        let ingredientToTopUp: Int = Ingredient.sampleData.firstIndex(where: {$0.name == entry.ingredient.name}) ?? -1
                        //Tops it up in ingredients.
                        if(ingredientToTopUp != -1 ) {
                            //if the item is found tops up the item
                            Ingredient.sampleData[ingredientToTopUp].currentAmount.amount = Ingredient.sampleData[ingredientToTopUp].lastBoughtAmount.amount
                        }
                        else {
                            //adds the ingredient in the case that it is not there
                            let lastChecker: Ingredient = Ingredient.sampleData.last!
                            let id = (lastChecker.id + 1)
                            var holderIngredient = entry.ingredient
                            holderIngredient.id = id
                            ingAdder(ingredient: holderIngredient)
                        }
                        }
                    //if the item is unstriked it adds the item back to the list in case an item is accidentally striked
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
        //sets nav title
        .navigationTitle("Shopping List")
    }
}

struct ShoppingListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
