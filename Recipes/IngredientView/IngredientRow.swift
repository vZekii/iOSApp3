//
//  IngredientRow.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation
import SwiftUI
struct IngredientRow: View {
    let ingredient : Ingredient
    var body: some View {
        //defaults the values to allow for easy changing
        let amountLeft = ingredient.currentAmount.amount
        let lastBought = ingredient.lastBoughtAmount.amount
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    //dynamically displays the name of the ingredient in the row
                    Text("\(ingredient.name)")
                        .font(.headline)
                    Text("Last filled to")
                        .font(.subheadline)
                    //checks the % of item left
                    if amountLeft <= (0.2 * lastBought) {
                        //checks if IOS 15
                        if #available(iOS 15.0, *) {
                            //sets a progress bar for the % left with colour depending on %
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.red)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                    else if amountLeft <= (0.5 * lastBought) {
                        //checks if IOS 15
                        if #available(iOS 15.0, *) {
                            //sets a progress bar for the % left with colour depending on %
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.yellow)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                    else {
                        //checks if IOS 15
                        if #available(iOS 15.0, *) {
                            //sets a progress bar for the % left with colour depending on %
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.green)
                        }
                    }
                }
                Spacer()
            }
            
        }
    }
}

struct IngredientRow_Previews: PreviewProvider {
    static var previews: some View {
        IngredientRow(ingredient: Ingredient.sampleData[0])
    }
}
