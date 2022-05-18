//
//  StaggerView.swift
//  Recipes
//
//  Created by Andrew VS on 18/05/2022.
//

import SwiftUI

struct StaggerView<Content: View,T: Identifiable>: View where T: Hashable {
    
    var content: (T) -> Content
    
    var list: [T]
    
    var columns: Int
    
    var showIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int,showIndicators: Bool = false, spacing: CGFloat = 10, list: [T],@ViewBuilder content: @escaping (T) -> Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showIndicators = showIndicators
        self.columns = columns
    
    }
    
    func setUpList()->[[T]]{
        
        
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
        
        
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: showIndicators) {
            HStack(alignment: .top) {
                
                ForEach(setUpList(), id: \.self) {columnsData in
                    
                    LazyVStack(spacing: spacing) {
                        ForEach(columnsData) {object in
                            content(object)
                        }
                    }
                }
                
            }
            .padding(.vertical)
        }
    }
}

struct StaggerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
