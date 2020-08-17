//
//  ContentView.swift
//  Shared
//
//  Created by Shiva Narrthine on 17/08/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            List {
                NavigationLink(
                    destination: InstagramView(),
                    label: {
                        Text("Instagram")
                })
                NavigationLink(
                    destination: TwitterView(),
                    label: {
                        Text("Twitter")
                })
            }
            .listStyle(SidebarListStyle())
            
            .navigationTitle("Swift Layouts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
