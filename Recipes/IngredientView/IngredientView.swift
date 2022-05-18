//
//  IngredientView.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//TESTING

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
                    VStack {
                    
                        NavigationLink(destination: ShoppingListDetailView(), label: { Image(systemName:
                                                                                                "cart")}).padding();
                        NavigationLink(destination: AddIngredientDetailView(), label: { Image(systemName:
                                                                                                        "plus")})
                    }
                    
                }
                .padding()
                
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
    func deleteIngredient(ingredient: Ingredient) {
        Ingredient.sampleData.remove(at:
                                        0)
      
        
    }
        
      
        }


func toUp() {
    let alert = UIAlertController(title: "Add to shopping list", message: "How much would you like to add", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("tapped Dismiss") }))
    

}

    
        
// potential code for later on
        
//        NavigationView {
//            ScrollView {
//                VStack {
//                    // Top text and profile button
//                    HStack {
//                        Text("Recipes")
//                            .font(.largeTitle.bold())
//
//                        Spacer()
//
//                        NavigationLink {
//                            Text("Profile View")
//                        } label: {
//                            Image(systemName: "person.crop.circle")
//                                .font(.largeTitle)
//                                .foregroundColor(.blue)
//                        }
//                    }
//
//                }
//                .padding()
//            }
//            .navigationBarHidden(true)
//        }
        

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
