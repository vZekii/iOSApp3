//
//  Recipe.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import Foundation
import SwiftUI

// This was written before the data structure thing in the doc so it has to be changed.
struct Recipe: Identifiable {
    var id: Int
    var name: String
    var photos: [Image]
    var description: String
    var ingredients: [RecipeIngredient] // change this to an ingredient struct with portion
    var timeToMake: Int // in minutes
    var servings: Int
    var difficulty: Int // 1-5
    var instructions: [String]
    var timesMade: Int
    var dietaryRequirements: [DietaryRequirements]
    var userNotes: String
}

func cookable(recipe: Recipe) -> Bool {
//    for i in recipe.ingredients {
//
//    }
    return true
}

extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(id: 1,
               name: "Spaghetti bolognese",
               photos: [Image("pasta")],
               description: "Our best ever spaghetti bolognese is super easy and a true Italian classic with a meaty, chilli sauce. This recipe comes courtesy of BBC Good Food user Andrew Balmer",
               // instead of defining all the ingredients repetively, we should generate a list that we can reference via id
               ingredients: [
                    RecipeIngredient(ingredient: "Pasta", measurement: Measurement(name: .gram, amount: 500)),
                    RecipeIngredient(ingredient: "Olive Oil", measurement: Measurement(name: .mililitre, amount: 30)),
                    RecipeIngredient(ingredient: "Bacon Rasher", measurement: Measurement(name: .number, amount: 4), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Brown Onion", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Carrot", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Celery Stick", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Garlic Clove", measurement: Measurement(name: .number, amount: 2), preperation: "finely chopped"),
                    RecipeIngredient(ingredient: "Rosemary Leaves", measurement: Measurement(name: .number, amount: 3), preperation: "picked and finely chopped"),
                    RecipeIngredient(ingredient: "Beef Mince", measurement: Measurement(name: .gram, amount: 500)),

               ],
               timeToMake: 120,
               servings: 5,
               difficulty: 1,
               instructions: ["Put a large saucepan on a medium heat and add 1 tbsp olive oil.",
                              "Add 4 finely chopped bacon rashers and fry for 10 mins until golden and crisp.",
                              "Reduce the heat and add the 2 onions, 2 carrots, 2 celery sticks, 2 garlic cloves and the leaves from 2-3 sprigs rosemary, all finely chopped, then fry for 10 mins. Stir the veg often until it softens.",
                              "Increase the heat to medium-high, add 500g beef mince and cook stirring for 3-4 mins until the meat is browned all over.",
                              "Add 2 tins plum tomatoes, the finely chopped leaves from ¾ small pack basil, 1 tsp dried oregano, 2 bay leaves, 2 tbsp tomato purée, 1 beef stock cube, 1 deseeded and finely chopped red chilli (if using), 125ml red wine and 6 halved cherry tomatoes. Stir with a wooden spoon, breaking up the plum tomatoes.",
                              "Bring to the boil, reduce to a gentle simmer and cover with a lid. Cook for 1 hr 15 mins stirring occasionally, until you have a rich, thick sauce.",
                              "Add the 75g grated parmesan, check the seasoning and stir.",
                              "When the bolognese is nearly finished, cook 400g spaghetti following the pack instructions.",
                              "Drain the spaghetti and either stir into the bolognese sauce, or serve the sauce on top. Serve with more grated parmesan, the remaining basil leaves and crusty bread, if you like.",
                              
                             ],
               timesMade: 0,
               dietaryRequirements: [DietaryRequirements(name: "vegan")],
               userNotes: ""
            ),
       Recipe(id: 2,
              name: "Scrambled eggs",
              photos: [Image("eggs")],
              description: "The fluffy moist scrambled eggs is great for anyone and easy to make!",
              ingredients: [
                     RecipeIngredient(ingredient: "Eggs", measurement: Measurement(name: .number, amount: 4)),
                     RecipeIngredient(ingredient: "Milk", measurement: Measurement(name: .mililitre, amount: 200)),
                     RecipeIngredient(ingredient: "Water", measurement: Measurement(name: .mililitre, amount: 200)),
                     RecipeIngredient(ingredient: "Cheese", measurement: Measurement(name: .gram, amount: 100)),
                     RecipeIngredient(ingredient: "Oil", measurement: Measurement(name: .mililitre, amount: 30)),
                     RecipeIngredient(ingredient: "Butter", measurement: Measurement(name: .gram, amount: 50)),
                     RecipeIngredient(ingredient: "Salt", measurement: Measurement(name: .gram, amount: 1)),
                     RecipeIngredient(ingredient: "Pepper", measurement: Measurement(name: .gram, amount: 1)),
              ],
              timeToMake: 10,
              servings: 2,
              difficulty: 1,
              instructions: [
"If you plan on adding cheese to your eggs, make sure that the cheese is shredded/prepared and set aside so you can add it to the skillet quickly. Place your skillet on the stovetop and turn on the heat. I leave the heat somewhere between medium low and medium, so it warms up but doesn't get too hot.",
"Meanwhile, prepare your eggs. Break them into a bowl with a tablespoon of water or milk, some salt and pepper. I use about 1/8 tsp salt and a pinch of pepper; you might use more or less according to taste. If you're dairy intolerant or don't like the taste of milk you can use water. I personally love the way milk enhances the flavor of the eggs.",
"Use a fork or whisk to beat the eggs briskly for 30-60 seconds, making sure the eggs are fully broken up and mixed well with the milk and the seasonings. Use a little elbow grease here, the more you whip it the better.",
"Lightly grease your hot skillet, coating the surface with a thin layer of oil or butter (or a combination of oil and butter). If using spray oil, use caution and keep it away from any open gas flames.",
"Pour the eggs into the skillet. Keep the heat on medium/medium low, you don't want to rush it here-- if the skillet is too hot the eggs will cook too quickly and become rubbery. Once you pour the eggs in they will begin to cook immediately. Using a spatula (I use a wooden or silicone spatula so I won't damage my pan's nonstick coating), begin pulling the cooked outer edges in towards the center of the eggs. Uncooked eggs will flood the area you just pulled back. If you are adding cheese, now is the time to sprinkle it into the skillet. This will allow ample time for the cheese to melt and integrate into the eggs.",
"Move the spatula around the edge of the skillet, pulling the cooked edges towards the center and re-flooding repeatedly. Cooked scrambled eggs will gather in the center of the skillet.",
"At a certain point, the uncooked eggs will no longer flood and the scramble will all collect in the center of the skillet, but it will still be slightly runny in texture. Begin breaking up the scramble; quickly turn undercooked areas and keep the scramble moving to make sure that all surfaces cook evenly. Never leave a surface in contact too long with the skillet or it will become overcooked.",
"Turn off the heat when the eggs are 90% cooked. When the eggs are done, serve immediately. Perfectly cooked scrambled eggs are moist but not runny, with no crisp or brown edges. This technique may take a bit of practice, but it is quite simple. With time you too will be making and serving moist, fluffy scrambled eggs!",
              ],
              timesMade: 0,
              dietaryRequirements: [DietaryRequirements(name: "vegetarian")],
              userNotes: ""
                ),
                     
}
