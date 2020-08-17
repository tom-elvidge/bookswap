//
//  User.swift
//  bookswap
//
//  Created by Tom Elvidge on 17/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

struct User {
    var username: String
    var displayName: String?
    var pictureUrl: String?
    var about: String?
    var likes: [Book]
    var library: [Book]
}
