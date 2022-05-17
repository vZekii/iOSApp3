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
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Recipes")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))

    }
    
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return Recipe.sampleData
        } else {
            return Recipe.sampleData.filter { $0.name.contains(searchText)}
        }
    }
    
}
        
        
// potential code for later on
        
//        NavigationView {
//            ScrollView {
//                VStack {
//                    // Top text and profile button
//                    HStack {
//                        Text("Recipes")
//                            .font(.largeTitle.bold())
//
//                        Spacer()
//
//                        NavigationLink {
//                            Text("Profile View")
//                        } label: {
//                            Image(systemName: "person.crop.circle")
//                                .font(.largeTitle)
//                                .foregroundColor(.blue)
//                        }
//                    }
//
//                }
//                .padding()
//            }
//            .navigationBarHidden(true)
//        }
        

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
