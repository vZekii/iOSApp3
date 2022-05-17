//
//  ContentView.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import SwiftUI

// Just our tab view controller (just for switching tabs)
struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("hi")
                Text("test2")
            }
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
