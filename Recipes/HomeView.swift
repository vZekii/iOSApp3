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
    var postText = ["Ingredients", "Profile", "Recipes", "Shopping List", "New Recipe"]
    var descText = ["Add all the Ingredients needed!","Check your Pofile","See all Curated Recipes","Make sure to not miss a single ingredient!","Fruit Salad has been Added!"]
    var body: some View {
        
        NavigationView{
            
            StaggerView(columns: 2, list: posts, content: { post in
                
                PostCardView(post: post)
            })
                .navigationTitle("Home");
        }
        .onAppear {
            
            for index in 1...5 {
                if (posts.count < 5) { //for some reason this code is repeated when changing views, this is a hot fix
                    posts.append(Post(imageURL: "post\(index)", text: postText[index-1], descText: descText[index-1]))
                }
                //posts[index] = Post(imageURL: "post\(index)", text: "hi")
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
                
            Text(post.text).font(.headline)
            HStack() {
                Text(post.descText).font(.subheadline).frame(maxWidth: .infinity, alignment: .center)
            }
            
            
        }.background(Rectangle().foregroundColor(Color.gray.opacity(0.1)).cornerRadius(10))
    }
}
