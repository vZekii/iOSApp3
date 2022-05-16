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
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    HStack {
                        Image(systemName: "tick")
                        Text("Can cook")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                    Text("Havent made before")
                        .font(.subheadline)
                }
                Spacer()
                Text("\(recipe.difficulty)")
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
