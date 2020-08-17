//
//  LibraryView.swift
//  bookswap
//
//  Created by Tom Elvidge on 12/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct LibraryView: View {

    @State var bookIds: [String] = []
    let title: String = "Library"
    let subtitle: String = "These are the books you want to give away in swaps."
    
    var body: some View {
        VStack(alignment: .center) {
            // Title and See All
            HStack(alignment: .bottom) {
                // Title
                Text(self.title)
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
                Text(self.subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                // Push left
                Spacer()
            }
            
//            // Books preview
//            HStack(spacing: 15) {
//                ForEach(getPreviewBookIds(bookIds: bookIds, size: 3), id: \.self) { bookId in
//                    BookTileView(bookId: bookId)
//                }
//            }
        }
    }
    
    func seeAll() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("See all...")
//                ForEach(buildGridLayout(bookIds: bookIds, columns: 3), id: \.self) { row in
//                    HStack(spacing: 15) {
//                        ForEach(row, id: \.self) { bookId in
//                            BookTileView(bookId: bookId)
//                        }
//                    }
//                }
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
            }
                .padding()
        }
        .navigationBarTitle(Text(self.title), displayMode: .inline)
    }
    
    func buildGridLayout(bookIds: [String], columns: Int) -> [[String]] {
        var layout: [[String]] = []
        
        // Add all the full rows.
        if bookIds.count >= columns {
            for i in stride(from: 0, to: bookIds.count-1, by: columns) {
                layout.append(Array(bookIds[i..<i+columns]))
            }
        }
        
        // Add the final row.
        let from = bookIds.count - (bookIds.count % columns)
        layout.append(Array(bookIds[from..<bookIds.count]))
        
        return layout
    }

    func getPreviewBookIds(bookIds: [String], size: Int) -> [String] {
        if bookIds.count < size {
            return bookIds
        } else {
            return Array(bookIds[0..<size])
        }
    }
    
}

struct LibraryView_Preview: PreviewProvider {
    static var previews: some View {
        LibraryView(bookIds: ["twok", "aq", "sd", "tfe"])
    }
}
