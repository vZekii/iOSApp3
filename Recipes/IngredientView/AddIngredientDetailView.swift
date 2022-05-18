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
    @State var name: String = ""
    @State var type: IngredientType = IngredientType.misc
    @State var typeHolder = "None Selected"
    @State var unitHolder = "Grams"
    @State var unitType: Measurement = Measurement(name: .number, amount: 1.0)
    @State var lastBoughtString: String = ""
    
    var body: some View {
        let lastChecker: Ingredient = Ingredient.sampleData.last!
        var id = (lastChecker.id + 1)
        VStack {
            Text("Please Select Food Type")
            Menu {
                Button {
                    let holderType: IngredientType = .vegetable
                    type = holderType
                    typeHolder = "Vegetable"
                } label: {
                    Text("Vegetable")
                }
                Button {
                    let holderType: IngredientType = .noodle
                    type = holderType
                    typeHolder = "Noodle"
                } label: {
                    Text("Noodle")
                }
                Button {
                    let holderType: IngredientType = .dairy
                    type = holderType
                    typeHolder = "Dairy"
                } label: {
                    Text("Dairy")
                }
            } label: {
                 Text(typeHolder)
            }
            Text("Enter Ingredients name")
            TextField("Name...", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("Enter default amount")
            HStack{
            TextField("Amount...", text: $lastBoughtString).textFieldStyle(.roundedBorder).padding()
                Menu {
                    Button {
                       unitHolder = "Milileters"
                        unitType = Measurement(name: .mililitre, amount: Float(lastBoughtString) ?? 0.0)
                    } label: {
                        Text("Milileters")
                    }
                    Button {
                        unitHolder = "Grams"
                        unitType = Measurement(name: .gram, amount: Float(lastBoughtString) ?? 0.0)
                    } label: {
                        Text("Grams")
                    }
                    Button {
                        unitHolder = "Units"
                        unitType = Measurement(name: .number, amount: Float(lastBoughtString) ?? 0.0)
                    } label: {
                        Text("Units")
                    }
                } label: {
                     Text(unitHolder)
                     Image(systemName: "ruler")
                }
            }
  
           Button{
               let newIngredient = Ingredient(id: id, name: name, type: type , lastBoughtAmount: unitType, currentAmount: unitType)
                let checker = Ingredient.sampleData.contains{$0.name == name }
                if !checker {
                    ingAdder(ingredient: newIngredient)
                    id += 1
                    
                    unitType = Measurement(name: .number, amount: 0.0)
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






/*
 e1, e2, e3, e4, e5, e6, e7
 add e8
 id = 9
 e1, e2, e3, e4, e5, e6, e7, e8
 delete e5
 e1, e2, e3, e4 e6, e7, e8
 
 
 */
