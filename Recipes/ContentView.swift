//
//  ContentView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .systemGray6
    }
    
    @State private var selection = 1
    
    var body: some View {
            TabView(selection: $selection) {
                IngredientView()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Ingredients")
                    }
                    .tag(0)
                
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(1)
                
                RecipeView()
                    .tabItem {
                        Image(systemName: "lock.doc")
                        Text("Recipes")
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .tag(3)
                    
            }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
