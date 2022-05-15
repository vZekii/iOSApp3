//
//  RecipeView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        let data = Recipe.sampleData
        // content for the recipe page
        NavigationView {
            List(data) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Recipes")
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
