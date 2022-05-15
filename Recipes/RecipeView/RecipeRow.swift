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
        HStack {
            recipe.photos[0]
                .resizable()
                .frame(width: 66, height: 66)
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text("Can cook")
                    .font(.subheadline)
                Text("Havent made before")
                    .font(.subheadline)
            }
            Spacer()
            Text("\(recipe.difficulty)")
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe.sampleData[0])
    }
}
