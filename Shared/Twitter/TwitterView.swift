//
//  TwitterView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 17/08/2020.
//

import SwiftUI

struct TwitterView: View {
    
    init(){
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView{
            content.tabItem {
                Image(systemName: "house.fill")
            }
            
            Text("Search").tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("Notifications").tabItem {
                Image(systemName: "bell")
            }
            
            Text("Messages").tabItem {
                Image(systemName: "envelope")
            }
        }
    }
    
    var content: some View{
        ZStack(alignment: .bottomTrailing) {
            VStack {
                HStack{
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 24))
                    Spacer()
                    Image(uiImage: #imageLiteral(resourceName: "Twitter-logo"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                    Spacer()
                    Image(systemName: "wand.and.stars")
                        .foregroundColor(.blue)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
                
                ScrollView {
                    Divider()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 16){
                            EventCard()
                            LiveEventCard()
                        }
                        .padding(.leading, 16)
                        .padding(.bottom, 8)
                    }
                    
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9015719891, green: 0.9261345267, blue: 0.9429815412, alpha: 1)))
                    
                    Tweet(type: "image", isVerifiedUser: true)
                    Tweet(type: "link", isVerifiedUser: true)
                    Tweet()
                    Tweet(type: "link")
                    Tweet(isVerifiedUser: true)
                }
            }
            
            Image("icon_tweet")
                .padding()
                .background(Color(#colorLiteral(red: 0.1195575371, green: 0.6316951513, blue: 0.9470062852, alpha: 1)))
                .clipShape(Circle())
                .offset(x: -10, y: -10)
                .shadow(color: Color.black.opacity(0.5), radius: 10)
            
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
            .preferredColorScheme(.light)
    }
}

struct Tweet: View {
    var type: String = "default"
    var isVerifiedUser: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 40))
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Username")
                            .bold()
                            .foregroundColor(.primary)
                        if isVerifiedUser {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        Text("@handle")
                        Circle()
                            .frame(width: 2, height: 2)
                            .offset(y: 1)
                        Text("1m")
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia massa nibh, at vestibulum ipsum.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if type == "image"{
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .frame(height: 200)
                    }
                    else if type == "link" {
                        
                        VStack {
                            Rectangle()
                                .frame(height: 140)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                HStack{
                                    Image(systemName: "link")
                                    Text("link.com")
                                }
                                .font(.caption)
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        
                    }
                    
                    
                    HStack{
                        Image(systemName: "bubble.left")
                        Text("12")
                        Spacer()
                        Image(systemName: "arrow.2.squarepath")
                        Text("100")
                        Spacer()
                        Image(systemName: "heart")
                        Text("62")
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                    }
                    .padding(.top, 8)
                    .font(.system(size: 14))
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                }
            }
            .padding(.horizontal, 16)
            
            Divider()
        }
    }
}

struct EventCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .frame(height: 120)
            HStack(alignment: .top) {
                Text("Updates on the Covid-19 situation in Malaysia")
                    .font(.footnote)
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            }
        }
        .frame(width: 184)
    }
}

struct LiveEventCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .frame(height: 120)
                
                Text("LIVE")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .padding(2)
                    .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .offset(x: 6, y: -6)
            }
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 30))
                VStack(alignment: .leading) {
                    Text("Username")
                        .bold()
                    Text("@handle")
                        .foregroundColor(.gray)
                }
                .font(.footnote)
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            }
        }
        .frame(width: 184)
    }
}
