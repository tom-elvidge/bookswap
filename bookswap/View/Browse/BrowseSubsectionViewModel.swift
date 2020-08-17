//
//  BrowseSubsectionViewModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

class BrowseSubsectionViewModel: ObservableObject {
    
    var api = ExampleData.getExampleData()
    
    @Published var subsection: Subsection
    
    init(subsectionId: String) {
        if let subsection = api.getSubsection(id: subsectionId) {
            self.subsection = subsection
        } else {
            self.subsection = Subsection.init(id: subsectionId, title: "Not Found", subtitle: "Subsection not found.", books: [])
        }
    }
    
    func getMoreResults() {
        var newResults: [Book] = []
        for bookid in api.getBooks() {
            newResults.append(api.getBook(id: bookid)!)
        }
        subsection.books.append(contentsOf: newResults)
    }
    
    func getGridLayoutIndicies(books: [Book], columns: Int) -> [Range<Int>] {
        // Have to use indicies in order to get bindings to the original struct.
        var layout: [Range<Int>] = []
        // Add all the full rows.
        if books.count >= columns {
            for i in stride(from: 0, to: books.count-1, by: columns) {
                layout.append(i..<i+columns)
            }
        }
        // Add the final row.
        let from = books.count - (books.count % columns)
        layout.append(from..<books.count)
        // Return the complete layout.
        return layout
    }
    
    func getPreviewBookIndicies(books: [Book], size: Int) -> Range<Int> {
        // Have to use indicies in order to get bindings to the original struct.
        if books.count < size {
            return (0..<books.count)
        } else {
            return (0..<size)
        }
    }
    
}
