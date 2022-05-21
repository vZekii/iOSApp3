//
//  IngredientView.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.


import Foundation
import SwiftUI


struct IngredientView: View {
    @State private var alertPressed = false
    @State var searchText = ""
    @State var  myIngredient: Ingredient?
    
    
    //enables the search function of the page to find ingredients.
    var searchResults: [Ingredient] {
        if searchText.isEmpty {
            return Ingredient.sampleData
        } else {
            return Ingredient.sampleData.filter { $0.name.contains(searchText)}
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                //Creates a list of ingredients dynamically
               List(searchResults) { ingredient in
                   //checks that it is running ios 15
                    if #available(iOS 15.0, *) {
                        IngredientRow(ingredient: ingredient)
                             //adds the delete swipe action
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    let index = Ingredient.sampleData.firstIndex(of: ingredient)
                                    Ingredient.sampleData.remove(at: index!)
                                        //used for updating
                                        searchText = "hi"
                                        searchText = ""
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            //topup swipe action
                            .swipeActions(edge: .leading) {
                                Button() {
                                    //enables the alert and provides the ingredient used
                                    self.alertPressed = true
                                     myIngredient = ingredient
                                    
                                } label: {
                                    Label("Top up", systemImage: "plus")
                                }
                                .tint(.green)
                                //Add to shoppinglist
                                Button() {
                                    var lastValue = 0
                                    if ShoppingList.sampleData.count > 0 {
                                        //this get max is used to find the highest id to id the values correctly
                                        lastValue = getMaxId() + 1
                                    }
                                    let holderIngredient = ShoppingList(id: lastValue, ingredient: ingredient, measurement:  ingredient.lastBoughtAmount)
                                    ShoppingList.sampleData.append(holderIngredient)
                                } label: {
                                    Label("Add to shopping list", systemImage: "cart")
                                }
                                .tint(.blue)
                                
                            }
                            //This alert is what is used to top up the the ingredients
                            .alert(isPresented: $alertPressed, content: {
                                Alert(title: Text("Top up ingredients"), message: Text("Do you want to top off to your default amount?"), primaryButton: .destructive(Text("Cancel")), secondaryButton: .default(Text("Top up"), action: {
                                    //sets the amount back to full
                                    let index = Ingredient.sampleData.firstIndex(of: myIngredient!)
                                    Ingredient.sampleData[index!].currentAmount = Ingredient.sampleData[index!].lastBoughtAmount
                                }))
                            })
                    } else {
                        // Fallback on earlier versions
                        List(Ingredient.sampleData, rowContent: IngredientRow.init)
                    }
               }
                //enablees the search feature
               .searchable(text: $searchText)
                }
            //sets the styling and nav title
            .listStyle(.grouped)
            .navigationTitle("Ingredients")
            .toolbar {
                //using a toolbar we can keep the buttons to access other pages
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ShoppingListDetailView(), label: { Image(systemName: "cart")})
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: AddIngredientDetailView(), label: { Image(systemName: "plus")})
                }
                //updating is important as the list isn't loading dynamically
                ToolbarItem(placement: .automatic) {
                    Button{
                        searchText = "Updating"
                        searchText = ""
                    } label: {
                        Text("Refresh")
                        Image(systemName: "repeat")
                    }
                }
            }
        }
                
    }
      
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
