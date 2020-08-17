//
//  MyUser.swift
//  bookswap
//
//  Created by Tom Elvidge on 15/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

// Use as an enviroment object so that user info for the logged in user is accessible everywhere.
class MyUser: ObservableObject {
    
    // Use a mock api for now.
    private var api: ApiMock = ApiMock.getApiMock()
    
    @Published var user: User?
    
//    @Published var username: String?
//    @Published var displayName: String?
//    @Published var pictureUrl: String?
//    @Published var about: String?
//    @Published var likes: [Book2]?
//    @Published var library: [Book2]?
    
    init(username: String) {
        // Attempt to log in with inital user credentials.
        logIn(username: username)
    }
    
    func logIn(username: String) {
        // Get user details from api.
        if let user = api.getUser(username: username) {
            // Log in if credentials are correct.
            self.user = user
        } else {
            print("Error: Bad credentials for \(username).")
        }
    }
    
    // Can user a bang to unwrap user if there is a user logged in.
    func isLoggedIn() -> Bool {
        // If the optional var user is not nil then there is a user logged in.
        return self.user != nil
    }
    
    func inLikes(book: Book2) -> Bool {
        if isLoggedIn() {
            return user!.likes.contains(where: {$0 == book})
        } else {
            print("Cannot check if liked because there is no user logged in.")
            return false
        }
    }
    
    func addToLikes(book: Book2) {
        if !inLikes(book: book) {
            // If not logged in then cannot like.
            if !isLoggedIn() {
                print("Cannot like if there is no user logged in.")
                return
            }
            // Book cannot be in the same user's library and likes.
            if inLibrary(book: book) {
                print("Cannot like because the book is already in the user's library.")
                return
            }
            // Add the book to the logged in user's likes.
            user!.likes.append(book)
        }
    }
    
    func removeFromLikes(book: Book2) {
        if inLikes(book: book) {
            if isLoggedIn() {
                // If already liked the remove from user's likes.
                let i = user!.likes.firstIndex(of: book)! // Can use bang because we know the book is in the array.
                user!.likes.remove(at: i)
            } else {
                print("Cannot unlike if there is no user logged in.")
            }
        }
    }
    
    func inLibrary(book: Book2) -> Bool {
        if isLoggedIn() {
            return user!.library.contains(where: {$0 == book})
        } else {
            print("Cannot check if in library because there is no user logged in.")
            return false
        }
    }
    
    func addToLibrary(book: Book2) {
        if !inLibrary(book: book) {
            // If not logged in then cannot like.
            if !isLoggedIn() {
                print("Cannot add to library if there is no user logged in.")
                return
            }
            // Book cannot be in the same user's library and likes.
            if inLikes(book: book) {
                print("Cannot add to library because the book is already in the user's likes.")
                return
            }
            // Add the book to the logged in user's library.
            user!.library.append(book)
        }
    }
    
    func removeFromLibrary(book: Book2) {
        if inLibrary(book: book) {
            if isLoggedIn() {
                // If already in library the remove from user's library.
                let i = user!.library.firstIndex(of: book)! // Can use bang because we know the book is in the array.
                user!.library.remove(at: i)
            } else {
                print("Cannot remove from library if there is no user logged in.")
            }
        }
    }
    
}
