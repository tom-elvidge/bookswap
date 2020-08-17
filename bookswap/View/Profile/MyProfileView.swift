//
//  MyProfileView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    
    @ObservedObject var myProfileViewModel: MyProfileViewModel = MyProfileViewModel()
       
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(myProfileViewModel.displayName)
                    Text(myProfileViewModel.username)
                    
                    // Library
                    LibraryView(bookIds: myProfileViewModel.library)
                }
                    .padding()
            }
                .navigationBarTitle(Text(myProfileViewModel.username), displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyProfileView_Preview: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
