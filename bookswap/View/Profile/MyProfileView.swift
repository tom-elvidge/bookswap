//
//  MyProfileView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    
    @EnvironmentObject var session: Session
       
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // User profile banner
                    HStack {
                        // Profile picture
                        // Can use bang on user as this view will only be displayed if a user is logged in.
                        UrlImageView(urlString: session.user!.pictureUrl)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 3))
                        // User details and stats
                        VStack(alignment: .leading) {
                            // Display name
                            Text(session.user!.displayName)
                                .font(.title)
                                .fontWeight(.bold)
                            // Username
                            Text(session.user!.username)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Spacer()
                            // User stats
                            Text("\(session.user!.likes.count) likes, \(session.user!.library.count) in library, 0 swaps.")
                            Spacer()
                        }
                            .padding()
                    }
                    // User about text
                    if session.user!.about != nil {
                        Text(session.user!.about!)
                    }
                    Divider()
                    // Library
                    // Passing constants but this root view will be re-rendered if session changes, so ok?
                    SubsectionView(
                        books: .constant(session.user!.library),
                        title: .constant("Library"),
                        subtitle: .constant("These are the books you want to give away in swaps.")
                    )
                    // Likes
                    SubsectionView(
                        books: .constant(session.user!.likes),
                        title: .constant("Likes"),
                        subtitle: .constant("These are the books you want to received in swaps.")
                    )
                }
                    .padding()
            }
                .navigationBarTitle(Text(session.user!.username), displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyProfileView_Preview: PreviewProvider {
    static var previews: some View {
        MyProfileView()
            .environmentObject(Session(username: "steve"))
    }
}
