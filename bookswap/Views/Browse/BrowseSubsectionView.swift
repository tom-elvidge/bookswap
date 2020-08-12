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
            VStack {
                ForEach(browseSubsectionViewModel.subsection!.bookIds, id:\.self) { bookId in
                    BookTileView(bookId: bookId)
                }
                // Todo: If scrolled to bottom, get next set of results using api pagination. Can you maintain scroll position when these are added?
            }
                .padding()
        }
        .navigationBarTitle(Text(browseSubsectionViewModel.subsection!.title), displayMode: .inline)
    }
    
}

struct BrowseSubsectionView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSubsectionView(subsectionId: "matchRightNow")
    }
}
