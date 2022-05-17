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
    
    init(list: [T],@ViewBuilder content: @escaping (T) -> Content){
        self.content = content
        self.list = list
    
    }
    
    var body: some View {
        VStack {
            
            ForEach(list) {object in
                content(object)
            }
            
        }
    }
}

struct StaggerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
