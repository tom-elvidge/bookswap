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
                    // Disbale See All button if there are no books.
                    .disabled(books.isEmpty)
            }
                
            // Subtitle
            HStack {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                // Push left
                Spacer()
            }
            
            HStack {
                // Books preview
                if books.isEmpty {
                    Text("There are no books here...")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(red: 0.25, green: 0.25, blue: 0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .shadow(radius: 3)
                        .padding()
                } else {
                    // Add book tiles.
                    ForEach(getPreviewBookIndicies(books: books, size: 3), id: \.self) { index in
                        BookTileView(book: self.$books[index])
                    }
                    // Add blank rectangles to fill row.
                    ForEach((0..<(3 - getPreviewBookIndicies(books: books, size: 3).count)), id: \.self) { i in
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(width: UIScreen.main.bounds.size.width / 3.5, height: 10)
                    }
                }
            }
        }
    }
    
    func seeAll() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(getGridLayoutIndicies(books: books, columns: 3), id: \.self) { row in
                    HStack(spacing: 15) {
                        // Add book tiles.
                        ForEach(row, id: \.self) { index in
                            BookTileView(book: self.$books[index])
                        }
                        // Add blank rectangles to fill row.
                        ForEach((0..<(3 - row.count)), id: \.self) { i in
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: UIScreen.main.bounds.size.width / 3.5, height: 10)
                        }
                    }
                }
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
//                Button(action: {
//                    self.getMoreResults()
//                }, label: {
//                    Text("Load more...")
//                })
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
    
//    func getMoreResults() {
//        var results: [Book] = []
//        for bookId in api.getBooks() {
//            results.append(api.getBook(id: bookId)!)
//        }
//        books.append(contentsOf: results)
//    }
    
}

struct SubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Filled book preview.
                SubsectionView(
                    books: .constant([
                        ExampleData.getExampleData().getBook(id: "twok")!,
                        ExampleData.getExampleData().getBook(id: "tnotw")!,
                        ExampleData.getExampleData().getBook(id: "aq")!
                    ]),
                    title: .constant("Title"),
                    subtitle: .constant("Subtitle")
                )
                // Partially filled book preview.
                SubsectionView(
                    books: .constant([
                        ExampleData.getExampleData().getBook(id: "tnotw")!,
                        ExampleData.getExampleData().getBook(id: "aq")!
                    ]),
                    title: .constant("Title"),
                    subtitle: .constant("Subtitle")
                )
                // Empty book preview.
                SubsectionView(
                    books: .constant([]),
                    title: .constant("Title"),
                    subtitle: .constant("Subtitle")
                )
            }
        }
            .environmentObject(Session(username: "tom"))
    }
}
