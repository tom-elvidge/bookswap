//
//  BrowseSubsectionView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BrowseSubsectionView: View {
    
    @ObservedObject var browseSubsectionViewModel: BrowseSubsectionViewModel
    
    init(subsectionId: String) {
        browseSubsectionViewModel = BrowseSubsectionViewModel(subsectionId: subsectionId)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            // Cannot use if let in SwiftUI View.
            // Don't display browse subsection if browseSubsectionViewModel.subsection is nil
            if browseSubsectionViewModel.subsection != nil {
                // Title and See All
                HStack(alignment: .bottom) {
                    // Title
                    Text(browseSubsectionViewModel.subsection!.title)
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
                    Text(browseSubsectionViewModel.subsection!.subtitle)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    // Push left
                    Spacer()
                }
                
                HStack(spacing: 15) {
                    // Books preview
                    ForEach(browseSubsectionViewModel.subsection!.previewBooksIds, id: \.self) { bookId in
                        BookTileView(bookId: bookId)
                    }
                }
            }
        }
    }
    
    func seeAll() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(buildGridLayout(bookIds: browseSubsectionViewModel.subsection!.bookIds, columns: 3), id: \.self) { row in
                    HStack(spacing: 15) {
                        ForEach(row, id: \.self) { bookId in
                            BookTileView(bookId: bookId)
                        }
                    }
                }
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
            }
                .padding()
        }
        .navigationBarTitle(Text(browseSubsectionViewModel.subsection!.title), displayMode: .inline)
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
    
}

struct BrowseSubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSubsectionView(subsectionId: "matchRightNow")
    }
}
