//
//  ContentView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Launch with BrowseTabView selected.
    @State private var selection = 1
 
    var body: some View {
        TabView(selection: $selection){
            MyProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: (selection == 0 ? "person.fill" : "person"))
                        Text("Profile")
                    }
                }
                .tag(0)
            BrowseView()
                .tabItem {
                    VStack {
                        Image(systemName: (selection == 1 ? "square.grid.2x2.fill" : "square.grid.2x2"))
                        Text("Browse")
                    }
                }
                .tag(1)
            ChatView()
                .tabItem {
                    VStack {
                        Image(systemName: (selection == 2 ? "message.fill" : "message"))
                        Text("Chat")
                    }
                }
                .tag(2)
            SwapsView()
                .tabItem {
                    VStack {
                        Image(systemName: (selection == 3 ? "arrow.right.arrow.left.square.fill" : "arrow.right.arrow.left.square"))
                        Text("Swaps")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
