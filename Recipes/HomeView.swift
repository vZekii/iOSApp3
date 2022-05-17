//
//  ContentView.swift
//  Recipes
//
//  Created by Zach Clare on 5/5/2022.
//

import SwiftUI

// Just our tab view controller (just for switching tabs)
struct HomeView: View {
    @State var posts: [Post] = []
    var body: some View {
        
        NavigationView{
            
            StaggerView(list: posts, content: { post in
                
                Text(post.imageURL)
            })
                .navigationTitle("Home");
        }
        .onAppear {
            for index in 1...10 {
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
