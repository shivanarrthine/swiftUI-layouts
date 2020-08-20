//
//  InstagramSearchView.swift
//  SwiftLayouts
//
//  Created by Shiva Narrthine on 17/08/2020.
//

import SwiftUI

struct InstagramSearchView: View {
    var body: some View {
        VStack {
            Color.white
                .frame(height: 0)
            
            ScrollView {
                
                // SearchBar
                HStack(spacing: 16) {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                        Spacer()
                    }
                    .foregroundColor(.gray)
                    .padding(.all, 8)
                    .background(Color(#colorLiteral(red: 0.9015719891, green: 0.9261345267, blue: 0.9429815412, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    Image(systemName: "viewfinder")
                }
                .padding(.horizontal, 16)
                
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 120),
                        spacing: 1
                        )
                    ],
                    spacing: 1,
                    pinnedViews: [.sectionHeaders]
                ){
                    Section(header: filterBar) {
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
                }
                
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
    
    var filterBar: some View {
        // Filters
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    FilterLabel(title: "IGTV", icon: "tv.fill")
                    FilterLabel(title: "Shop", icon: "bag.fill")
                    FilterLabel(title: "Architecture")
                    FilterLabel(title: "Art")
                    FilterLabel(title: "Food")
                    FilterLabel(title: "Sports")
                }
                .padding(.bottom, 4)
            }
            .padding(.leading, 16)
            .padding(.vertical, 4)
        }
        .background(Color.white)
    }
}

struct InstagramSearchView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramSearchView()
    }
}

struct FilterLabel: View {
    var title: String
    var icon: String?
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
            }
            Text(title)
                .bold()
                .fixedSize(horizontal: true, vertical: false)
        }
        .font(.footnote)
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 1)
    }
}
