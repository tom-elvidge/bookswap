//
//  BrowseViewModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

class BrowseViewModel: ObservableObject {
    
    var api = ExampleData.getExampleData()
    
    // List of all subsection ids.
    @Published var subsectionIds: [String]
    
    init() {
        subsectionIds = api.getSubsections()
    }
    
}
