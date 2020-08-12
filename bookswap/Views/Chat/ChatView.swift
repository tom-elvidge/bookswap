//
//  ChatView.swift
//  bookswap
//
//  Created by Tom Elvidge on 02/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Chat")
                }
                    .padding()
            }
                .navigationBarTitle("Chat", displayMode: .inline)
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ChatView_Preview: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
