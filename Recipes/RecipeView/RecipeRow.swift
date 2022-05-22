//
//  RecipeRow.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeRow: View {
    // Displays each recipe as a row - used in the recipe view and to show reccomendations at the bottom of the detail view
    let recipe: Recipe
    // State to manage whether the recipe is cookable
    @State var canCook: Bool
    var body: some View {
        VStack {
            HStack {
                recipe.photos[0]
                    .resizable()
                    .frame(width: 66, height: 66)
                    .cornerRadius(100)
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    HStack {
                        // display a checkmark if it's cookable, otherwise show a x mark
                        if canCook {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                                .font(.subheadline)
                            Text("Can cook")
                                .font(.subheadline)
                                .foregroundColor(.green)
                                .offset(x: -5)
                        } else {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("Can't cook")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .offset(x: -5)
                        }
                    }

                }
                Spacer()
                //Text("\(recipe.difficulty)")
            }
            
            //  we'll use this later for showing exactly how many ingredients are missing
//            ProgressView(value: Float(recipe.difficulty), total: 5.0)
//                .progressViewStyle(.linear)
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe.sampleData[0], canCook: cookable(recipe: Recipe.sampleData[0]))
    }
}
