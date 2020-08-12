//
//  BrowseSubsectionViewModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

struct Subsection {
    var id: String
    var title: String
    var subtitle: String
    var previewBooksIds: [String]
    var bookIds: [String]
}

class BrowseSubsectionViewModel: ObservableObject {
    
    // subsections variable since there is no database or api yet.
    private var subsections: Dictionary<String, Subsection> = [
        "matchRightNow":
            Subsection.init(
                id: "matchRightNow",
                title: "Match Right Now",
                subtitle: "Readers with these books are interested in your library.",
                previewBooksIds: ["twok", "aq", "tfe"],
                bookIds: ["twok", "aq", "tfe"]
            ),
        "recentlyAdded":
            Subsection.init(
                id: "recentlyAdded",
                title: "Recently Added",
                subtitle: "These books have been added by other readers recently.",
                previewBooksIds: ["sd", "aq", "tfe"],
                bookIds: ["sd", "aq", "tfe", "twok"]
            )
    ]
    
    @Published var subsection: Subsection?
    
    init(subsectionId: String) {
        // Attempt to get the Subsection with the passed subsectionId.
        if let subsection = subsections[subsectionId] {
            // A Subsection with subsectionId exists, set Subsection.
            self.subsection = subsection
            // Get preview bookIds from all bookIds.
//            if (subsection.bookIds.count <= size) {
//                // Get all bookIds.
//                return Array(subsection.bookIds[0...(subsection.bookIds.count - 1)])
//            } else {
//                // Just get first $size bookIds.
//                return Array(subsection.bookIds[0...(size - 1)])
//            }
        } else {
            // No Subsection with subsectionId.
            print("Error: No Subsection with subsectionId.")
        }
    }
    
    func moreResults() {
        // This is called when the user gets to the bottom of the list of books of this subsection.
        // Call the api to get the next set of bookIds and append them to bookIds.
    }
    
}
