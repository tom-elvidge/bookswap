//
//  Book.swift
//  bookswap
//
//  Created by Tom Elvidge on 17/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

struct Book: Identifiable, Equatable {
    var id: String
    var title: String
    var authors: [String]
    var publisher: String?
    var description: String?
    var imageUrlString: String?
}
