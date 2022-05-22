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
            
            StaggerView(columns: 2, list: posts, content: { post in
                
                PostCardView(post: post)
            })
                .navigationTitle("Home");
        }
        .onAppear {
            for index in 1...3 {
                posts.append(Post(imageURL: "post\(index)", text: "hi"))
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
        
        VStack() {
            Image(post.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                
            Text(post.text)
        }.background(Rectangle())
    }
}
