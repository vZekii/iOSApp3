//
//  RecipeView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        // content for the recipe page
        NavigationView {
            Text("Recipe")
                .navigationTitle("Recipes")
                
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
        
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
