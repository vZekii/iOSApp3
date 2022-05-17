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
    @State var type: IngredientType?
    @State var typeHolder = "None Selected"
    @State var unitHolder = "Grams"
    @State var unitType: Measurement = Measurement(name: .number, amount: 0.0)
    @State var lastBoughtString: String = ""
    
    var body: some View {
        var id = Ingredient.sampleData.count
        VStack {
            Text("Pleease Select Food Type")
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
            TextField("Name...", text: $name).textFieldStyle(.roundedBorder).padding()
            Text("Enter default amount")
            HStack{
            TextField("Amount...", text: $lastBoughtString).textFieldStyle(.roundedBorder).padding()
                Menu {
                    Button {
                       unitHolder = "Milileters"
                        let holderMeasurement = Measurement(name: .mililitre, amount: Float(lastBoughtString) ?? 0.0)
                        unitType = holderMeasurement
                    } label: {
                        Text("Milileters")
                    }
                    Button {
                        unitHolder = "Grams"
                        let holderMeasurement = Measurement(name: .gram, amount: Float(lastBoughtString) ?? 0.0)
                        unitType = holderMeasurement
                    } label: {
                        Text("Grams")
                    }
                    Button {
                        unitHolder = "Units"
                        let holderMeasurement = Measurement(name: .number, amount: Float(lastBoughtString) ?? 0.0)
                        unitType = holderMeasurement
                    } label: {
                        Text("Units")
                    }
                } label: {
                     Text(unitHolder)
                     Image(systemName: "ruler")
                }
            }
  
           Button{
               let newIngredient = Ingredient(id: id, name: name, type: type ?? .dairy, lastBoughtAmount: unitType, currentAmount: unitType)
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


