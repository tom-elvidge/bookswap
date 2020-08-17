//
//  HomeTabView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BrowseTabView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Search box
                
                Text("Discover")
                
                // Suggested books based of currently interested in books
                HStack {
                    NavigationLink(destination: Text("Book Details View Here")) {
                            Text("Clickable Book Tile")
                    }
                        .navigationBarTitle("Book Title Here", displayMode: .inline)
                }
                
                Text("Recently Added")
                
                // Recently added book tiles
                
                Text("Match Right Now")
                
                // Book tiles you can match with instantly
            }
            .navigationBarTitle("Home", displayMode: .large)
        }
    }
}

struct HomeTabView_Preview: PreviewProvider {
    static var previews: some View {
        BrowseTabView()
    }
}
