//
//  InstagramView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 17/08/2020.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct InstagramView: View {
    @State var showStory : Bool = false
    
    init(){
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        
        ZStack{
            tabbar
            
            Color.black
                .opacity(showStory ? 1 : 0)
                .edgesIgnoringSafeArea(.all)
            fullStoryContent
        }
    }
    
    var content: some View {
        ZStack {
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
                            StoryBubble(username: "Your story", isViewed: true, isUser: true)
                            ForEach(0 ..< 10) { item in
                                StoryBubble()
                                    .onTapGesture {
                                        withAnimation(.easeInOut){
                                            showStory.toggle()
                                        }
                                    }
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
    
    @ViewBuilder
    var fullStoryContent: some View {
        StoryView(showStory: $showStory)
            
    }
    
    var tabbar: some View{
        TabView{
            content.tabItem {
                Image(systemName: "house.fill")
            }
            
            InstagramSearchView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("Post").tabItem {
                Image(systemName: "plus.square")
            }
            
            Text("Activity").tabItem {
                Image(systemName: "heart")
            }
            
            Text("Profile").tabItem {
                Image(systemName: "person.crop.circle.fill")
            }
        }
        .font(.system(size: 20))
        .accentColor(.primary)
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
                .font(.footnote)
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

struct StoryBubble: View {
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
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
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



struct StoryView: View {
    @Binding var showStory: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.yellow)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VStack {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color.white.opacity(1))
                            Rectangle()
                                .foregroundColor(Color.white.opacity(0.5))
                            Rectangle()
                                .foregroundColor(Color.white.opacity(0.5))
                        }
                        .frame(height: 2)
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 32))
                            
                            Text("username")
                                .font(.subheadline).bold()
                            
                            Text("3h")
                                .font(.caption)
                            
                            Spacer()
                            
                            Button(action: {showStory = false} ) {
                                Image(systemName: "xmark")
                                    .font(.system(size: 24))
                            }
                            
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: screen.height - 140)
                
                Spacer()
                
                HStack(spacing: 16){
                    HStack {
                        Image(systemName: "camera.fill")
                            .padding(.all, 8)
                            .background(Color.white.opacity(0.5))
                            .clipShape(Circle())
                        Text("Send message")
                        Spacer()
                    }
                    .padding(.all, 4)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                    
                    Image(systemName: "paperplane")
                        .font(.system(size: 20))
                    Image(systemName: "ellipsis")
                        .font(.system(size: 20))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .scaleEffect(showStory ? 1 : 0)
            .animation(.easeInOut(duration: 0.1))
        }
    }
}
