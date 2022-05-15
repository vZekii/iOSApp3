//
//  IngredientView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct IngredientView: View {
    var body: some View {
        // content for the ingredient page
        NavigationView {
            Text("Ingredient")
                .navigationTitle("Ingredients")

        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
