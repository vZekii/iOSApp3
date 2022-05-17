//
//  IngredientRow.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation
import SwiftUI

let progressView = UIProgressView(progressViewStyle: .bar)

struct IngredientRow: View {
    let ingredient : Ingredient
    var body: some View {
        let amountLeft = ingredient.currentAmount
        let lastBought = ingredient.lastBoughtAmount
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ingredient.name)")
                        .font(.headline)
                    
                    Text("Last filled to")
                        .font(.subheadline)
                    if amountLeft <= 0.2 * lastBought {
                        if #available(iOS 15.0, *) {
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.red)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                    else if amountLeft <= 0.5 * lastBought {
                        if #available(iOS 15.0, *) {
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.yellow)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                    else {
                        if #available(iOS 15.0, *) {
                            ProgressView("Amount Left...", value: amountLeft, total: lastBought).tint(Color.green)
                        } else {
                            // Fallback on earlier versions
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
