//
//  RecipeView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            // List each recipe in the sample data, creating a link to a detail view for each one as well
            List(searchResults) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe, cookable: cookable(recipe: recipe))
                } label: {
                    RecipeRow(recipe: recipe, canCook: cookable(recipe: recipe))
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Recipes")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))

    }
    
    // filter our results if a search is made
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return Recipe.sampleData
        } else {
            return Recipe.sampleData.filter { $0.name.contains(searchText)}
        }
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
