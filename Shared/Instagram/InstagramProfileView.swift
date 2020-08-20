//
//  InstagramProfileView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 18/08/2020.
//

import SwiftUI

struct InstagramProfileView: View {
    @State var selectedView = 1
    @Binding var showAccList : Bool
    @Binding var showMenu : Bool
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                nav
                
                ScrollView {
                    header
                    content
                }
            }
        }
        
    }
    
    var nav: some View {
        HStack {
            // this icon is just to balance the view
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                self.showAccList.toggle()
            }){
                Image(systemName: "lock.fill")
                    .font(.footnote)
                Text("username")
                    .font(.subheadline)
                    .bold()
                Image(systemName: "chevron.down")
                    .font(.footnote)
            }
            .accentColor(.primary)
            
            Spacer()
            
            Button(action: {
                self.showMenu.toggle()
            }){
                Image(systemName: "line.horizontal.3")
            }
            .accentColor(.primary)
        }
        .padding(.horizontal, 16)
    }
    
    var header: some View {
        VStack {
            VStack(spacing: 16) {
                HStack{
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                        ZStack(alignment: .center) {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                        }
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 40) {
                        VStack(alignment: .center, spacing: 2) {
                            Text("532")
                                .font(.subheadline)
                                .bold()
                            Text("Posts")
                                .font(.footnote)
                        }
                        VStack(alignment: .center, spacing: 2) {
                            Text("152")
                                .font(.subheadline)
                                .bold()
                            Text("Followers")
                                .font(.footnote)
                        }
                        
                        VStack(alignment: .center, spacing: 2) {
                            Text("208")
                                .font(.subheadline)
                                .bold()
                            Text("Following")
                                .font(.footnote)
                        }
                    }
                    .padding(.trailing, 30)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Profile Name")
                        .bold()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu.")
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 30)
                    Text("website.com")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.2156862745, blue: 0.4196078431, alpha: 1)))
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Edit Profile")
                        .font(.footnote)
                        .bold()
                }
                .accentColor(.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                )
                .shadow(color: Color.black.opacity(0.1), radius: 2)
            }
            .padding(.horizontal, 16)
            
            Divider()
        }
    }
    
    var subtabs: some View {
        ZStack(alignment: .bottomLeading) {
            HStack {
                Image(systemName: "rectangle.split.3x3")
                    .font(.system(size: 20))
                    .opacity(selectedView == 1 ? 1 : 0.5)
                    .frame(width: screen.width/2, height: 44)
                    .background(Color.white)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            selectedView = 1
                        }
                        
                    }
                
                Image(systemName: "person.crop.rectangle")
                    .font(.system(size: 20))
                    .opacity(selectedView == 2 ? 1 : 0.5)
                    .frame(width: screen.width/2, height: 44)
                    .background(Color.white)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            selectedView = 2
                        }
                    }
            }
            Rectangle()
                .frame(width: screen.width/2, height: 2)
                .foregroundColor(.primary)
                .offset(x: selectedView == 1 ? 0 : screen.width/2)
        }
        .background(Color.white)
    }
    
    var content: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 120),
                spacing: 1
                )
            ],
            spacing: 1,
            pinnedViews: [.sectionHeaders]
        ){
            Section(header: subtabs) {
                if selectedView == 1{
                    ForEach(0 ..< 30) { item in
                        ZStack(alignment: .topTrailing) {
                            Rectangle()
                                .frame(height: 120)
                            if(item % 5 == 0){
                                Image(systemName: "square.fill.on.square.fill")
                                    .foregroundColor(.white)
                                    .offset(x: -6, y: 6)
                            }
                            
                        }
                    }
                }
                else if selectedView == 2 {
                    // TOFIX: Bug when using ForEach
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .frame(height: 120)
                }
                
            }
        }
    }
}

struct InstagramProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramProfileView(showAccList: .constant(false), showMenu: .constant(false))
    }
}
