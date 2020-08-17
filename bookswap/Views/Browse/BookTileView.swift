//
//  BookTileView.swift
//  bookswap
//
//  Created by Tom Elvidge on 15/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BookTileView: View {
    
    @Binding var book: Book2
    @EnvironmentObject var myUser: MyUser
    
    // Height and width to use for book tile.
    private var width: CGFloat
    private var height: CGFloat
    
    // Default off black color to use when tile missing a book cover.
    let tileColor: Color = Color(red: 0.1, green: 0.1, blue: 0.1)
       
    init(book: Binding<Book2>) {
        self._book = book
        
        // Calculate width and heigh of book tiles.
        // Divide screen width by 3.5 to give room for 3 tiles, spacing and padding.
        self.width = UIScreen.main.bounds.size.width / 3.5
        // Multiply tile width by 1.6 to get a good book cover aspect ratio.
        self.height = width * 1.6
    }
    
    var body: some View {
        ZStack {
            // Display book details as new view on navigation stack.
            NavigationLink(destination: BookDetailsView(book: $book)) {
                ZStack {
                    // Use book cover is one exists.
                    if book.imageUrlString == nil {
                        bookTileNoImage()
                    } else {
                        UrlImageView(urlString: book.imageUrlString)
                    }
                    // Conditionally display liked overlay.
                    if myUser.inLikes(book: book) {
                        overlay(systemName: "heart.fill", color: Color.white)
                    }
                    // Conditionally display inLibrary overlay.
                    if myUser.inLibrary(book: book) {
                        overlay(systemName: "checkmark", color: Color.white)
                    }
                }
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(radius: 3)
                    // Define double tap action (like book).
                    .onTapGesture(count: 2) {
                        self.toggleLike()
                    }
                    // Define long press acself.tion (get more options).
                    .contextMenu {
                        // Toggle liked
                        Button(action: {
                            self.toggleLike()
                        }) {
                            Text(myUser.inLikes(book: book) ? "Unlike" : "Like")
                        }
                        // Toggle inLibrary
                        Button(action: {
                            self.toggleInLibrary()
                        }) {
                            Text(myUser.inLibrary(book: book) ? "Remove from library" : "Add to library")
                        }
                    }
            }
                .buttonStyle(PlainButtonStyle())
        }
    }
    
    func bookTileNoImage() -> some View {
        ZStack {
            // Off black background color.
            tileColor
            // Book details overlay.
            VStack(spacing: 5) {
                // Title
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                // Authors
                Text(book.authors.joined(separator: ", "))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            }
                .padding(8)
        }
    }
    
    func overlay(systemName: String, color: Color) -> some View {
        VStack(alignment: .trailing, spacing: 0) {
            // Top banner.
            HStack {
                // Fill horizontal space so background fills banner.
                Spacer()
                // Image using passed icon.
                Image(systemName: systemName)
                    .foregroundColor(color)
                    .padding(10)
            }
                // Black opaque background.
                .background(tileColor.opacity(0.5))
            // Fade out the background using a gradient.
            LinearGradient(
                gradient:
                    Gradient(colors: [tileColor.opacity(0.5), tileColor.opacity(0)]),
                startPoint: .top,
                endPoint: .bottom
            )
                // Make frame shorter so the gradient doesn't cover the full tile.
                .frame(width: width, height: height/5, alignment: .top)
            // Push the overlay contents to the top.
            Spacer()
        }
    }
    
    func toggleLike() {
        // If not inLikes then like, otherwise remove from likes.
        if !self.myUser.inLikes(book: self.book) {
            self.myUser.addToLikes(book: self.book)
        } else {
            self.myUser.removeFromLikes(book: self.book)
        }
    }
    
    func toggleInLibrary() {
        // If not in library then add, otherwise remove from library.
        if !self.myUser.inLibrary(book: self.book) {
            self.myUser.addToLibrary(book: self.book)
        } else {
            self.myUser.removeFromLibrary(book: self.book)
        }
    }
    
}

struct BookTileView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BookTileView(book: .constant(ApiMock.getApiMock().getBook(id: "aq")!))
            BookTileView(book: .constant(ApiMock.getApiMock().getBook(id: "twok")!))
            BookTileView(book: .constant(ApiMock.getApiMock().getBook(id: "twmf")!))
        }
            .environmentObject(MyUser(username: "tom"))
    }
}
