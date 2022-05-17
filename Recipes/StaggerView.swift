//
//  StaggerView.swift
//  Recipes
//
//  Created by Andrew VS on 18/05/2022.
//

import SwiftUI

struct StaggerView<Content: View,T: Identifiable>: View {
    
    var content: (T) -> Content
    
    var list: [T]
    
    init(@ViewBuilder content: @escaping (T) -> Content){
        
    
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StaggerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
