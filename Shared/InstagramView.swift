//
//  InstagramView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 17/08/2020.
//

import SwiftUI

struct InstagramView: View {
    var body: some View {
        TabView{
            content.tabItem {
                Image(systemName: "house.fill")
            }
            
            Text("Feed").tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("Post").tabItem {
                Image(systemName: "plus.square")
            }
            
            Text("Activity").tabItem {
                Image(systemName: "heart")
            }
            
            Text("Profile").tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(.primary)
        
    }
    
    var content: some View {
        VStack {
            HStack{
                Image(systemName: "camera")
                    .font(.system(size: 20))
                Spacer()
                Image("Instagram-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                Spacer()
                Image(systemName: "paperplane")
                    .font(.system(size: 20))
            }
            .padding(.horizontal, 16)
            
            
            ScrollView {
                Divider()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 24) {
                        InstagramStory(username: "Your story", isViewed: true, isUser: true)
                        ForEach(0 ..< 10) { item in
                            InstagramStory()
                        }
                    }
                }
                .padding(.leading, 16)
                Divider()
                    .padding(.vertical, 8)
                
                ForEach(0 ..< 5) { item in
                    InstagramPost()
                }
            }
        
        }
    }
}

struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
    }
}

struct InstagramPost: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 28))
                VStack(alignment: .leading, spacing: 2) {
                    Text("username")
                        .font(.subheadline).bold()
                    Text("Location")
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(height: 340)
            
            HStack(spacing: 16) {
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.system(size: 18))
            .padding(.all, 16)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("35,694 likes")
                    .font(.caption).bold()
                HStack {
                    Text("username").bold() +
                        Text(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus ex ac sapien lacinia convallis. Nulla maximus ex ac sapien lacinia convallis.")
                }
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                
                
                Text("View all 487 comments")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("3 hours ago")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 30)
    }
}

struct InstagramStory: View {
    var username: String = "username"
    var isViewed: Bool = false
    var isUser: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .bottomTrailing) {
                ZStack {
                    Circle()
                        .stroke(
                            isViewed ?
                                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .leading, endPoint: .trailing)
                            :
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))]), startPoint: .leading, endPoint: .trailing),
                            style: StrokeStyle(lineWidth: 2, lineCap: .round)
                        )
                        .frame(width: 58, height: 60)
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 52))
                }
                
                
                if isUser {
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                
            }
            Text(username)
                .font(.caption)
                .foregroundColor(isUser ? .gray : .black)
        }
    }
}
