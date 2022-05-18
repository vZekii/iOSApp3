//
//  IngredientDetailView.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation

import SwiftUI

struct ShoppingListDetailView: View {
    struct EntryRow: View {
        @State private var striked = false
        var entry: ShoppingList
        var body: some View {
            Text("\(entry.measurement.getMeasurement()) \(entry.ingredient.name)")
                .strikethrough(striked)
                .onTapGesture {
                    self.striked.toggle()
                    //In future versions if the item gets striked it will remain in the session. However, it will remove from db. This makes it so users can unstrike accidentally striked items without deleting them.
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
