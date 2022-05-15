//
//  ContentView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        .onAppear() {
            UITabBar.appearance().barTintColor = .green // change the bar background to gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
