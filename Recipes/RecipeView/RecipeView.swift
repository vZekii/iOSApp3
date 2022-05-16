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
            VStack(alignment: .leading) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("LightGray"))
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchText)
                    }
                        .foregroundColor(.gray)
                        .padding(.leading, 13)
                    
                }
                    .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                
                List(Recipe.sampleData) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
                .listStyle(.grouped)
            }
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
