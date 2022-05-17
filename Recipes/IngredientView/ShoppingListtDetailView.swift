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
        
        var entry: ShoppingList
        var body: some View {
            Text("\(String(format: "%.2f", entry.measurement.amount)) \(entry.measurement.name) of \(entry.ingredient.name)")
        }
    }
        
    
    var body: some View {
        NavigationView {
            List(ShoppingList.sampleData, rowContent: EntryRow.init)
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
