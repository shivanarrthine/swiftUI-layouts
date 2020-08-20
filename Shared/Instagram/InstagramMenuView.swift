//
//  InstagramMenuView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 20/08/2020.
//

import SwiftUI

struct InstagramMenuView: View {
    @Binding var showMenu : Bool
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Color.black
                .opacity(self.showMenu ? 0.6: 0)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeIn)
                .onTapGesture {
                    self.showMenu.toggle()
                }
            
            VStack(alignment: .center) {
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 40, height: 4)
                    .padding(.top, 12)
                
                
                VStack {
                    ForEach(instagramMenuData) { item in
                        HStack(spacing: 16) {
                            Image(systemName: item.icon)
                                .font(.system(size: 24, weight: .light))
                                .frame(width: 50)
                            Text(item.title)
                                .font(.system(size: 18, weight: .light))
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.vertical, 20)
                        .overlay(
                            Rectangle()
                                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.5))
                                .frame(width: screen.width - 82, height: 1),
                            alignment: .bottomTrailing
                        )
                        
                    }
                }
                .padding(.bottom, 100)
                
                
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(y: self.showMenu ? 0 : screen.height)
            .offset(y: self.offset.height)
            .animation(.easeIn)
            .gesture(
                DragGesture().onChanged { value in
                    guard value.translation.height > 0 else { return }
                    self.offset = value.translation
                }
                .onEnded { value in
                    if self.offset.height > 200 {
                        self.showMenu = false
                    }
                    self.offset = .zero
                }
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
struct InstagramMenuView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramMenuView(showMenu: .constant(true))
    }
}

struct InstagramMenu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

var instagramMenuData = [
    InstagramMenu(title: "Settings", icon: "gear"),
    InstagramMenu(title: "Archive", icon: "gobackward"),
    InstagramMenu(title: "Your activity", icon: "clock"),
    InstagramMenu(title: "QR Code", icon: "qrcode.viewfinder"),
    InstagramMenu(title: "Saved", icon: "bookmark"),
    InstagramMenu(title: "Close friends", icon: "list.bullet"),
    InstagramMenu(title: "Discover people", icon: "person.badge.plus"),
]
