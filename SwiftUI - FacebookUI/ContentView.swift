//
//  ContentView.swift
//  SwiftUI - FacebookUI
//
//  Created by Saif on 20/06/19.
//  Copyright © 2019 LeftRightMind. All rights reserved.
//

import SwiftUI

struct Post {
    var id: Int
    var username, description, imageName : String
}

struct ContentView : View {
    
    let posts: [Post] = [
        .init(id: 0, username: "Prashant", description: "iOS developer", imageName: "0"),
        .init(id: 1, username: "Swapnil", description: "Android developer", imageName: "1"),
        .init(id: 2, username: "Mansi", description: "Android developer", imageName: "2"),
        .init(id: 3, username: "Aman", description: "iOS developer", imageName: "3")
        
    ]
    
    var body: some View {
        NavigationView{
            List {
                Text("Trending").font(.title)
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(posts.identified(by: \.id)){ post in
                                NavigationButton(destination: GroupDetailView(post: post)){
                                    GroupView(post: post)
                                }
                            }
                        }
                    }
                    }.frame(height:80)
                
                ForEach(posts.identified(by: \.id)){ post in
                    PostViews(post:post)
                }
                }
                .navigationBarTitle(Text("Groups"))
        }
    }
}

struct GroupDetailView: View {
    let post: Post
    var body: some View {
        VStack {
            Image(post.imageName)
            Text("user image")
        }.navigationBarTitle(Text(post.username))
    }
}

struct GroupView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            Image(post.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width:40,height:40)
                .clipped()
            Text(post.description)
                .color(.primary)
        }
    }
}

struct PostViews : View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            HStack {
                Image(post.imageName)
                    .resizable()
                    .frame(width:50,height: 50)
                VStack(alignment:.leading,spacing: 4) {
                    Text(post.username).font(.headline)
                    Text(post.description).font(.subheadline)
                }
            }
            Text(" Hiwerwerw erewr Hiwerwe rwerewr Hiwer werwer ewr Hiwerw erwer ewr Hiwe rwer w erewr Hiwerw erw erewr werw erewr Hiwerwe rwerewr Hiwer werwer ewr Hiwerw erwer ewr Hiwe rwer w erewr Hiwerw erw erewr").lineLimit(nil)
            Image(post.imageName)
                .resizable()
                .scaledToFill()
                .frame(height:200)
                .clipped()
            }.padding(.leading,-16).padding()
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
