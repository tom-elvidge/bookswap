//
//  MyProfileViewModel.swift
//  bookswap
//
//  Created by Tom Elvidge on 12/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import Foundation

class MyProfileViewModel: ObservableObject {
    
    @Published var username: String = "tomelvidge"
    @Published var displayName: String = "Tom"
    @Published var library: [String] = ["twok", "aq", "sd", "tfe"]
    @Published var liked: [String] = ["sd", "tfe", "twok", "aq"]
    
    init() {
        // Get profile details from api.
    }
    
    func addToLibrary(bookId: String) {
        
    }
    
    func removeFromLibrary(bookId: String) {
        
    }
    
    func like(bookId: String) {
        
    }
    
    func unlike(bookId: String) {
        
    }
    
    func seDisplayName(displayName: String) {
        
    }
    
}
