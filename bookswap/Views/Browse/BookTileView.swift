//
//  BookTileView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct BookTileView: View {
    
    @ObservedObject var bookViewModel: BookViewModel
    
    private var width: CGFloat
    private var height: CGFloat
       
    init(bookId: String) {
        bookViewModel = BookViewModel(bookId: bookId)
        
        // Calculate width and heigh of book tiles.
        self.width = UIScreen.main.bounds.size.width / 3.5
        self.height = width * 1.6
    }
    
    var body: some View {
        VStack {
            // Don't put anything in root VStack if nil book.
            if bookViewModel.book != nil {
                // Display book details as new view on navigation stack.
                NavigationLink(destination: BookDetailsView(bookViewModel: bookViewModel)) {
                    ZStack {
                        if bookViewModel.book!.imageUrlString == nil {
                            // Use card if no cover image.
                            bookTileNoImage()
                        } else {
                            // Use book cover image if one exists.
                            bookTile()
                        }
                    }
                        .frame(width: width, height: height)
                        .cornerRadius(2)
                }
                    .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    func bookTile() -> some View {
        // Use book cover image if one exists.
        UrlImageView(urlString: bookViewModel.book!.imageUrlString)
            .frame(width: width, height: height)
            .clipped()
    }
    
    func bookTileNoImage() -> some View {
        ZStack {
            // Dark gray background.
            Color(red: 0.1, green: 0.1, blue: 0.1, opacity: 1)
                .frame(width: width, height: height)
            // Book details overlay.
            VStack(spacing: 5) {
                Spacer()
                // Title
                Text(bookViewModel.book!.title)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                // Authors
                Text(bookViewModel.book!.authors.joined(separator: ", "))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
                .padding(8)
                .frame(width: width, height: height)
        }
    }
    
}

struct BookTileView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BookTileView(bookId: "twok")
            Spacer()
            BookTileView(bookId: "tfe")
            Spacer()
            BookTileView(bookId: "sd")
        }
            .padding()
    }
}
