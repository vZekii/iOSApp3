//
//  RecipesApp.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import SwiftUI

@main
struct RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                IngredientView()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Ingredients")
                    }
                
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                RecipeView()
                    .tabItem {
                        Image(systemName: "lock.doc")
                        Text("Recipes")
                    }
            }
        }
    }
}
