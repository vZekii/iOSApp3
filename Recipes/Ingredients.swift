//
//  Ingredients.swift
//  Recipes
//
//  Created by Bailey Mendonca on 15/5/2022.
//

import Foundation

struct IngredientView: View {
    var body: some View {
        TabView {
            Text("Ingredients")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
        }
    }
}
