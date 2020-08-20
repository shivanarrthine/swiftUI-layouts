//
//  InstagramAccountView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 20/08/2020.
//

import SwiftUI

struct InstagramAccountView: View {
    @Binding var showAccList : Bool
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Color.black
                .opacity(self.showAccList ? 0.6: 0)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeIn)
                .onTapGesture {
                    self.showAccList.toggle()
                }
            
            VStack(alignment: .center) {
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .frame(width: 40, height: 4)
                    .padding(.top, 12)
                
                
                AccountListItem(isCurrent: true)
                AccountListItem()
            
                
                HStack(spacing: 16) {
                    Image(systemName: "plus")
                        .font(.system(size: 32, weight: .light))
                        .frame(width: 50)
                    Text("Add account")
                        .font(.subheadline)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 60)
                
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(y: self.showAccList ? 0 : screen.height)
            .offset(y: self.offset.height)
            .animation(.easeIn)
            .gesture(
                DragGesture().onChanged { value in
                    guard value.translation.height > 0 else { return }
                    self.offset = value.translation
                }
                .onEnded { value in
                    if self.offset.height > 80 {
                        self.showAccList = false
                    } 
                    self.offset = .zero
                }
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct InstagramAccountView_Previews: PreviewProvider {
    
    static var previews: some View {
        InstagramAccountView(showAccList: .constant(true))
    }
}

struct AccountListItem: View {
    @State var isCurrent = false
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 50))
                    Text("username")
                        .foregroundColor(isCurrent ? .blue : .primary)
                        .font(.subheadline)
                        .bold()
                    Spacer()
                    if isCurrent {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 24))
                    }
                }
                .padding(.vertical, 16)
                
                if isCurrent {
                    HStack {
                        FilterLabel(title: "152 followers")
                        FilterLabel(title: "22 close friends")
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Divider()
        }
    }
}
