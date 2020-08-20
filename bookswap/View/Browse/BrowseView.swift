//
//  BrowseView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    
    @State var searchText: String = ""
    @State var subsectionIds: [String] = ExampleData.getExampleData().getSubsections()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Always display search bar.
                    SearchBar(text: $searchText)
                    // Display either browse suggestions or search results.
                    if (searchText.isEmpty) {
                        ForEach(subsectionIds, id: \.self) { id in
                            BrowseSubsectionView(subsectionId: id)
                        }
                    } else {
                        // Do api query when user has not typed a new character for .5s
                        searchResultsView()
                    }
                }
                    .padding()
            }
                .navigationBarTitle("Browse", displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func searchResultsView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(getGridLayout(books: getSearchResults(), columns: 3), id: \.self) { row in
                HStack(spacing: 15) {
                    ForEach(row, id: \.self) { book in
                        BookTileView(book: .constant(book))
                    }
                }
            }
        }
    }
    
    func getGridLayout(books: [Book], columns: Int) -> [[Book]] {
        // Have to use indicies in order to get bindings to the original struct.
        var layout: [[Book]] = []
        // Add all the full rows.
        if books.count >= columns {
            for i in stride(from: 0, to: books.count-1, by: columns) {
                layout.append(Array(books[i..<i+columns]))
            }
        }
        // Add the final row.
        let from = books.count - (books.count % columns)
        layout.append(Array(books[from..<books.count]))
        // Return the complete layout.
        return layout
    }
    
    func getSearchResults() -> [Book] {
        var results: [Book] = []
        let api = ExampleData.getExampleData()
        for id in api.getBooks() {
            if let book = api.getBook(id: id) {
                results.append(book)
            }
        }
        return results
    }
    
    
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BrowseView()
        }
    }
}
