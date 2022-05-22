//
//  Post.swift
//  Recipes
//
//  Created by Andrew VS on 18/05/2022.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL: String
    var text: String
    var descText: String
}

