//
//  RecipeRow.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                recipe.photos[0]
                    .resizable()
                    .frame(width: 66, height: 66)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .font(.subheadline)
                        Text("Can cook")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .offset(x: -5)
                    }
                    
//                    Text("Havent made before")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
                }
                Spacer()
                //Text("\(recipe.difficulty)")
            }
            
            ProgressView(value: Float(recipe.difficulty), total: 5.0)
                .progressViewStyle(.linear)
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe.sampleData[0])
    }
}
