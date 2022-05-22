//
//  Measurement.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

enum MeasurementName: String, Codable {
    case cup, teaspoon, tablespoon, mililitre, litre, gram, kilogram, number
}

// Model to store measurements of ingredients - will be extended in the future to allow automatic conversion between different measurements
struct Measurement: Hashable, Codable {
    var name: MeasurementName  // cup, teaspoon, etc
    var amount: Float
    
    func getMeasurement() -> String {
        // number is used to return without a measurement
        if name == .number {
            return "\(amount)"
        }
        // append an "s" at the end of measurements of more than 1
        else if amount >= 1.0 {
            return "\(amount) \(name.rawValue)s"
        }
        // otherwise just return the measurement
        return "\(amount) \(name.rawValue)"
    }
}
