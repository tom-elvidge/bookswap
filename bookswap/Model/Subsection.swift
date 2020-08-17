//
//  Subsection.swift
//  bookswap
//
//  Created by Tom Elvidge on 17/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

struct Subsection: Identifiable, Equatable {
    var id: String
    var title: String
    var subtitle: String
    var books: [Book]
}
