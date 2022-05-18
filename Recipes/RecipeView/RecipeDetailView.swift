//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                recipe.photos[0]
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    HStack {
                        Text(recipe.name)
                            .font(.title)
                        Spacer()
                    }
                    DifficultyView(difficulty: recipe.difficulty)
                    Spacer()
                    HStack {
                        Text("Serves \(recipe.servings)")
                            .font(.caption)
                        Spacer()
                        Text("Takes \(recipe.timeToMake) minutes")
                            .font(.caption)
                    }
                    Spacer()
                    HStack {
                        Text(recipe.description)
                            .font(.subheadline)
                        Spacer()
                    }
                    Spacer()
                    RecipeIngredientDisplay(ingredients: recipe.ingredients)
                    StepView(steps: recipe.instructions.count, steplist: recipe.instructions)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            VStack {
                                RecipeRow(recipe: .sampleData[3], canCook: cookable(recipe: .sampleData[3]))
                                RecipeRow(recipe: .sampleData[5], canCook: cookable(recipe: .sampleData[5]))
                            }
                            Spacer()
                            VStack {
                                RecipeRow(recipe: .sampleData[1], canCook: cookable(recipe: .sampleData[1]))
                                RecipeRow(recipe: .sampleData[4], canCook: cookable(recipe: .sampleData[4]))
                            }
                            VStack {
                                RecipeRow(recipe: .sampleData[6], canCook: cookable(recipe: .sampleData[6]))
                                RecipeRow(recipe: .sampleData[2], canCook: cookable(recipe: .sampleData[2]))
                            }
                        }
                    }
                    
//                    Button{
//                        let myvar = 3
//                    } label: {
//                        Text("Finish and remove ingredients")
//                            .background(.green)
//                            .foregroundColor(.white)
//                            .padding(.horizontal)
//                   }
                    
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeIngredientDisplay: View {
    let ingredients: [RecipeIngredient]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing:10) {
                ForEach(ingredients, id:\.self) { i in
                    VStack {
                        Text("\(i.measurement.getMeasurement()) \(i.ingredient) \(i.preperation)")
                        Text("Have \(getIngredientAmountFromName(name:i.ingredient))")
                    }
                    .padding()
                    .background(Color("LightGray"))
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct StepView: View {
    let steps: Int
    let steplist: [String]
    
    var body: some View {
        VStack {
            ForEach(0..<steps, id:\.self) { i in
                VStack {
                    HStack {
                        Text("Step \(i+1)")
                            .font(.headline)
                        Spacer()
                    }
                    HStack {
                        Text(steplist[i])
                        Spacer()
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct DifficultyView: View {
    let difficulty: Int
    
    var body: some View {
        HStack {
            Text("Difficulty: ")
                .foregroundColor(.gray)
            ForEach(0..<difficulty, id:\.self) { i in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            ForEach(0..<(5-difficulty), id:\.self) { i in
                Image(systemName: "star")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: .sampleData[0])
    }
}
