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
    @State var refresher: Bool = false;
    @State var  myIngredient: Ingredient?
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("LightGray"))
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search...", text: $searchText)
                    }
                        .foregroundColor(.gray)
                        .padding(.leading, 13)
                    
                }
                    .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                    HStack {
                    
                        NavigationLink(destination: ShoppingListDetailView(), label: { Image(systemName:
                                                                                                "cart")})
                        NavigationLink(destination: AddIngredientDetailView(), label: { Image(systemName:
                                                                                                "plus")}).padding()
                        Button{
                            searchText = "Updating"
                            searchText = ""
                        } label: {
                            Image(systemName: "repeat")
                        }
                    }
                    
                }
                
               List(Ingredient.sampleData) { ingredient in
                    if #available(iOS 15.0, *) {
                        IngredientRow(ingredient: ingredient)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    let index = Ingredient.sampleData.firstIndex(of: ingredient)
                                    Ingredient.sampleData.remove(at: index!)
                                        searchText = "hi"
                                        searchText = ""
                                    //NEEED TO FIGURE THIS OUT!?!?
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button() {

                                    self.alertPressed = true
                                     myIngredient = ingredient
                                    
                                } label: {
                                    Label("Top up", systemImage: "plus")
                                }
                                .tint(.green)
                                Button() {
                                    var lastValue = 0
                                    if ShoppingList.sampleData.count > 0 {
                                        lastValue = getMaxId() + 1
                                    }
                                    let holderIngredient = ShoppingList(id: lastValue, ingredient: ingredient, measurement:  ingredient.lastBoughtAmount)
                                    ShoppingList.sampleData.append(holderIngredient)
                                } label: {
                                    Label("Add to shopping list", systemImage: "cart")
                                }
                                .tint(.blue)
                                
                            }
                            .alert(isPresented: $alertPressed, content: {
                                Alert(title: Text("Top up ingredients"), message: Text("Do you want to top off to your default amount?"), primaryButton: .destructive(Text("Cancel")), secondaryButton: .default(Text("Top up"), action: {
                                    let index = Ingredient.sampleData.firstIndex(of: myIngredient!)
                                    Ingredient.sampleData[index!].currentAmount = Ingredient.sampleData[index!].lastBoughtAmount
                                }))
                            })
                    } else {
                        // Fallback on earlier versions
                        List(Ingredient.sampleData, rowContent: IngredientRow.init)
                    }
               }
                }
            .listStyle(.grouped)
            .navigationTitle("Ingredients")
                }
                
            }
        
      
        }

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
