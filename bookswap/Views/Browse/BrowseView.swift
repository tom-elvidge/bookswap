//
//  BrowseView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject var browseViewModel = BrowseViewModel()
    @ObservedObject var searchBar = SearchBar()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Display either browse suggestions or search results.
                    if (searchBar.text.isEmpty) {
                        ForEach(browseViewModel.subsectionIds, id: \.self) { subsectionId in
                            BrowseSubsectionView(subsectionId: subsectionId)
                        }
                    } else {
                        // Do api query when user has not typed a new character for .5s
                        Text("Search results for \(searchBar.text).")
                        //searchResults()
                    }
                }
                    .padding()
            }
                .navigationBarTitle("Browse", displayMode: .inline)
                .add(self.searchBar)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func searchResults() -> some View {
        ScrollView {
            VStack {
                ForEach(["all","bookId","results","for","searchBar.text"], id: \.self) { bookId in
                    BookTileView(bookId: bookId)
                }
                // If scrolled to bottom, get next set of results using api pagination.
            }
                .padding()
        }
            .navigationBarTitle(Text("Search Results"), displayMode: .inline)
    }
    
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
