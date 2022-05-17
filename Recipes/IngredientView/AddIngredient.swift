//
//  AddIngredient.swift
//  Recipes
//
//  Created by Bailey Mendonca on 16/5/2022.
//

import Foundation

import SwiftUI

struct AddIngredientDetailView: View {
    @State private var alertPressed = false
    var id = Ingredient.sampleData.count
    @State var name: String = ""
    @State var type: IngredientType?
    @State var lastBoughtString: String = ""
    @State var typeHolder = "None Selected"
    @State var unitHolder = "Grams"
    
    var body: some View {
        var id = Ingredient.sampleData.count
        VStack {
            Text("Pleease Select Food Type")
            Menu {
                Button {
                    var holderType: IngredientType = .vegetable
                    type = holderType
                    typeHolder = "Vegetable"
                } label: {
                    Text("Vegetable")
                }
                Button {
                    var holderType: IngredientType = .noodle
                    type = holderType
                    typeHolder = "Noodle"
                } label: {
                    Text("Noodle")
                }
                Button {
                    var holderType: IngredientType = .dairy
                    type = holderType
                    typeHolder = "Dairy"
                } label: {
                    Text("Dairy")
                }
            } label: {
                 Text(typeHolder)
            }
            Text("Enter Ingredients name")
            TextField("Name...", text: $name).textFieldStyle(.roundedBorder).padding()
            Text("Enter default amount")
            HStack{
            TextField("Amount...", text: $lastBoughtString).textFieldStyle(.roundedBorder).padding()
                Menu {
                    Button {
                       unitHolder = "Milileters"
                    } label: {
                        Text("Milileters")
                    }
                    Button {
                        unitHolder = "Grams"
                    } label: {
                        Text("Grams")
                    }
                    Button {
                        unitHolder = "Units"
                    } label: {
                        Text("Units")
                    }
                } label: {
                     Text(unitHolder)
                     Image(systemName: "ruler")
                }
            }
  
           Button{
                //Adds the ingredient to the list
               var newIngredient = Ingredient(id: id, name: name, type: type ?? .dairy, lastBoughtAmount: Double(lastBoughtString) ?? 0.0, currentAmount: Double(lastBoughtString) ?? 0.0)
                let checker = Ingredient.sampleData.contains{$0.name == name }
                if !checker {
                    ingAdder(ingredient: newIngredient)
                    id += 1
                }
                else {
                    alertPressed = true;
                }
            } label: {
                Text("Add ingredient")
            }
        }
        .padding()
        .alert(isPresented: $alertPressed, content: {
            Alert(title: Text("Ingredient Error"), message: Text("Entered existing ingredient, please either use existing entry or delete it and try again."), dismissButton: .destructive(Text("Dismiss")))
            
        })
    }
}

struct AddIngredientDetailViewComplete: View {
    var body: some View {
        Text("Ingredient added, please return home")
    }
}

