//
//  Measurement.swift
//  Recipes
//
//  Created by Zach Clare on 15/5/2022.
//

import Foundation

struct Measurement: Hashable, Codable {
    var name: String  // cup, teaspoon, etc
    var amount: Float
}
