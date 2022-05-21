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
    @State var unitHolder = "Select Unit"
    @State var unitType: Measurement = Measurement(name: .number, amount: 1.0)
    @State var lastBoughtString: String = ""
    
    var body: some View {
        //gets the last value of the last ingredient in list
        let lastChecker: Ingredient = Ingredient.sampleData.last!
        var id = (lastChecker.id + 1)
        VStack {
            //sets the enum for the food type chosen from the list and sets the type to be held for later adding. Once more types are added this system will be improved. However, for the MVP this is ok
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
            //gets the name for the ingredient
            Text("Enter Ingredients name")
            TextField("Name...", text: $name)
                //styling for name
                .textFieldStyle(.roundedBorder)
                .padding()
            //set the default amount
            Text("Enter default amount")
            HStack{
                TextField("Amount...", text: $lastBoughtString)
                        //set styling
                        .textFieldStyle(.roundedBorder)
                        .padding()
                //A menu that sets the measurement type and saves it in a holder to use for appending.
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
            //button to confirm adding.
           Button{
               let newIngredient = Ingredient(id: id, name: name, type: type , lastBoughtAmount: unitType, currentAmount: unitType)
               //error handling for double up on ingredientss
                let checker = Ingredient.sampleData.contains{$0.name == name }
                if !checker {
                    ingAdder(ingredient: newIngredient)
                    //increment id to stop double ups
                    id += 1
                    unitType = Measurement(name: .number, amount: 0.0)
                }
                else {
                    //alert if already exists
                    alertPressed = true;
                }
            } label: {
                Text("Add ingredient")
            }
        }
        .padding()
        //the alert that is ran if double
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


