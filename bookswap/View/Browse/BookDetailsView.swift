//
//  BookDetailsView.swift
//  bookswap
//
//  Created by Tom Elvidge on 15/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BookDetailsView: View {
    
    @Binding var book: Book
    @EnvironmentObject var session: Session
    
    // Height and width to use for book cover.
    private var width: CGFloat
    private var height: CGFloat
        
    init(book: Binding<Book>) {
        self._book = book
        
        // Calculate width and heigh of book cover.
        // Width should be a bit less than half the screen width to give room for the title text.
        self.width = UIScreen.main.bounds.size.width / 2.5
        // Multiply tile width by 1.6 to get a good book cover aspect ratio.
        self.height = width * 1.6
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 20) {
                    // Display book cover image if one exists.
                    if book.imageUrlString != nil {
                        cover()
                    }
                    // Book details.
                    details()
                    // Fill horizontal space, push cover and details to left.
                    Spacer()
                }
                // Add description if the book has one.
                if (book.description != nil) {
                    // Separate cover and details from description.
                    Divider()
                    // Description
                    Text(book.description!)
                }
            }
                .padding()
        }
            // Put book title in navigation bar.
            .navigationBarTitle(Text(book.title), displayMode: .inline)
            // Add buttons to like or add to the users library in navigation bar.
            .navigationBarItems(trailing:
                HStack(spacing: 20) {
                    likeButton()
                    addToLibraryButton()
                }
            )
    }
    
    func details() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            // Title
            Text(book.title)
                .font(.headline)
            // Author
            Text(book.authors.joined(separator: ", "))
                .font(.headline)
                .fontWeight(.regular)
            // Publisher, conditionally add to view because it's optional.
            if book.publisher != nil {
                Text(book.publisher!)
                    .font(.subheadline)
            }
        }
    }
    
    func cover() -> some View {
        UrlImageView(urlString: book.imageUrlString!)
        .frame(width: width, height: height)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 3)
    }
    
    func likeButton() -> some View {
        Button(action: {
            // If not inLikes then like, otherwise remove from likes.
            if !self.session.inLikes(book: self.book) {
                self.session.addToLikes(book: self.book)
            } else {
                self.session.removeFromLikes(book: self.book)
            }
        }) {
            Image(systemName: session.inLikes(book: book) ? "heart.fill" : "heart")
                .font(.system(size: 22, weight: .regular))
                .foregroundColor(session.inLikes(book: book) ? Color.red : Color.gray)
        }
    }
    
    func addToLibraryButton() -> some View {
        Button(action: {
            // If not in library then add, otherwise remove from library.
            if !self.session.inLibrary(book: self.book) {
                self.session.addToLibrary(book: self.book)
            } else {
                self.session.removeFromLibrary(book: self.book)
            }
        }) {
            Image(systemName: session.inLibrary(book: book) ? "checkmark.circle.fill" : "checkmark.circle")
                .font(.system(size: 22, weight: .regular))
                .foregroundColor(session.inLibrary(book: book) ? Color.blue : Color.gray)
        }
    }
    
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetailsView(book: .constant(ExampleData.getExampleData().getBook(id: "twok")!)).environmentObject(Session(username: "tom"))
        }
    }
}
