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
            // Title and See All
            HStack(alignment: .bottom) {
                // Title
                Text(browseSubsectionViewModel.subsection.title)
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
                Text(browseSubsectionViewModel.subsection.subtitle)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                // Push left
                Spacer()
            }
            
            HStack(spacing: 15) {
                // Books preview
                ForEach(browseSubsectionViewModel.getPreviewBookIndicies(books: browseSubsectionViewModel.subsection.books, size: 3), id: \.self) { index in
                    BookTileView(book: self.$browseSubsectionViewModel.subsection.books[index])
                }
            }
        }
    }
    
    func seeAll() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(browseSubsectionViewModel.getGridLayoutIndicies(books: browseSubsectionViewModel.subsection.books, columns: 3), id: \.self) { row in
                    HStack(spacing: 15) {
                        ForEach(row, id: \.self) { index in
                            BookTileView(book: self.$browseSubsectionViewModel.subsection.books[index])
                        }
                    }
                }
                Button(action: {
                    self.browseSubsectionViewModel.getMoreResults()
                }, label: {
                    Text("Load more...")
                })
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
            }
                .padding()
        }
        .navigationBarTitle(Text(browseSubsectionViewModel.subsection.title), displayMode: .inline)
    }
    
}

struct BrowseSubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSubsectionView(subsectionId: "matchRightNow")
    }
}
