//
//  MyProfileView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Profile")
                }
                    .padding()
            }
                .navigationBarTitle("Profile", displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyProfileView_Preview: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
