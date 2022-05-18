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
            
            StaggerView(columns: 1, list: posts, content: { post in
                
                PostCardView(post: post)
            })
                .navigationTitle("Home");
        }
        .onAppear {
            for index in 1...3 {
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

struct PostCardView: View{
    
    var post: Post
    
    var body: some View{
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
