//
//  SubsectionView.swift
//  bookswap
//
//  Created by Tom Elvidge on 21/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct SubsectionView: View {
    
    let api = ExampleData.getExampleData()
    
    @Binding var books: [Book]
    @Binding var title: String
    @Binding var subtitle: String
    
    var body: some View {
        VStack(alignment: .center) {
            // Title and See All
            HStack(alignment: .bottom) {
                // Title
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    
                // Space so that Title is on the left and See All is on the right.
                Spacer()
                
                // See All
                NavigationLink(destination: seeAll()) {
                    Text("See All")
                        .font(.subheadline)
                }
            }
                
            // Subtitle
            HStack {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                // Push left
                Spacer()
            }
            
            HStack(spacing: 15) {
                // Books preview
                ForEach(getPreviewBookIndicies(books: books, size: 3), id: \.self) { index in
                    BookTileView(book: self.$books[index])
                }
            }
        }
    }
    
    func seeAll() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(getGridLayoutIndicies(books: books, columns: 3), id: \.self) { row in
                    HStack(spacing: 15) {
                        ForEach(row, id: \.self) { index in
                            BookTileView(book: self.$books[index])
                        }
                    }
                }
                Button(action: {
                    self.getMoreResults()
                }, label: {
                    Text("Load more...")
                })
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
            }
                .padding()
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
    }

    func getGridLayoutIndicies(books: [Book], columns: Int) -> [Range<Int>] {
        // Have to use indicies in order to get bindings to the original struct.
        var layout: [Range<Int>] = []
        // Add all the full rows.
        if books.count >= columns {
            for i in stride(from: 0, to: books.count-1, by: columns) {
                layout.append(i..<i+columns)
            }
        }
        // Add the final row.
        let from = books.count - (books.count % columns)
        layout.append(from..<books.count)
        // Return the complete layout.
        return layout
    }
    
    func getPreviewBookIndicies(books: [Book], size: Int) -> Range<Int> {
        // Have to use indicies in order to get bindings to the original struct.
        if books.count < size {
            return (0..<books.count)
        } else {
            return (0..<size)
        }
    }
    
    func getMoreResults() {
        var results: [Book] = []
        for bookId in api.getBooks() {
            results.append(api.getBook(id: bookId)!)
        }
        books.append(contentsOf: results)
    }
    
}

struct SubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SubsectionView(
                books: .constant([
                    ExampleData.getExampleData().getBook(id: "twok")!,
                    ExampleData.getExampleData().getBook(id: "tnotw")!,
                    ExampleData.getExampleData().getBook(id: "aq")!
                ]),
                title: .constant("Title"),
                subtitle: .constant("Subtitle")
            )
        }
            .environmentObject(Session(username: "tom"))
    }
}
