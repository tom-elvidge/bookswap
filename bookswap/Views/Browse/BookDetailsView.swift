//
//  BookDetailsView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BookDetailsView: View {
    
    @ObservedObject var bookViewModel: BookViewModel
    
    private var width: CGFloat
    private var height: CGFloat
        
    init(bookViewModel: BookViewModel) {
        self.bookViewModel = bookViewModel
         
        // Calculate width and heigh of book tiles.
        // Width should be a bit less than half the screen width to give room for the title text.
        self.width = UIScreen.main.bounds.size.width / 2.5
        self.height = width * 1.5
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Don't display book if bookViewModel.book is nil
                if bookViewModel.book != nil {
                    HStack(alignment: .top, spacing: 20) {
                        // Display book cover image if one exists.
                        if bookViewModel.book!.imageUrlString != nil {
                            UrlImageView(urlString: bookViewModel.book!.imageUrlString)
                                .frame(width: width, height: height)
                                .clipped()
                                .cornerRadius(8)
                        }
                        // Book details
                        VStack(alignment: .leading, spacing: 3) {
                            // Title
                            Text(bookViewModel.book!.title)
                                .font(.headline)
                            // Author
                            Text(bookViewModel.book!.authors.joined(separator: ", "))
                                .font(.headline)
                                .fontWeight(.regular)
                            // Publish date
                            Text("Publish date")
                                .font(.subheadline)
                            // Publisher
                            Text("Publisher")
                                .font(.subheadline)
                            // Rating
                            Text("Rating")
                                .font(.subheadline)
                        }
                        // Push to left.
                        Spacer()
                    }
                    
                    Divider()
                    
                    // Description
                    Text(bookViewModel.book!.description)
                } else {
                    // bookViewModel.book is nil
                    Text("Book does not exist...")
                }
                
                // Push everything to the top
                Spacer()
            }
                .padding()
        }
            .navigationBarTitle(Text((bookViewModel.book != nil) ? bookViewModel.book!.title : ""), displayMode: .inline)
            .navigationBarItems(trailing:
                HStack(spacing: 20) {
                    // Like button
                    Button(action: {self.bookViewModel.toggleLike()}) {
                        Image(systemName: bookViewModel.book!.liked ? "heart.fill" : "heart")
                            .font(.system(size: 22, weight: .regular))
                    }
                        // Disable like if already in library.
                        .disabled(bookViewModel.book!.inLibrary)
                    // Add to library button
                    Button(action: {self.bookViewModel.toggleInLibrary()}) {
                        Image(systemName: bookViewModel.book!.inLibrary ? "tag.fill" : "tag")
                            .font(.system(size: 22, weight: .regular))
                    }
                        // Disable add to library if already liked.
                        .disabled(bookViewModel.book!.liked)
                }
            )
    }
    
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetailsView(bookViewModel: BookViewModel.init(bookId: "aq"))
        }
    }
}
