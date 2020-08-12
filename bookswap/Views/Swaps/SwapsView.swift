//
//  SwapsView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct SwapsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Swaps")
                }
                    .padding()
            }
                .navigationBarTitle("Swaps", displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SwapsView_Preview: PreviewProvider {
    static var previews: some View {
        SwapsView()
    }
}
